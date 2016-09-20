class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:github, :facebook]
  mount_uploader :avatar, AvatarUploader

  has_many :cards, dependent: :destroy
  has_many :progressions, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :submission_replies, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :mentor_sessions
  has_many :student_sessions
  has_many :notifications, foreign_key: :recipient_id

  validates :first_name, :last_name, presence: true
  validates :package, presence: true, if: :is_student?

  before_save :update_name!
  after_create :send_slack
  # after_create :set_admitted!

  enum package: [:remote, :immersive]

  scope :admitted, -> { where(admitted: true) }
  scope :active_prework_students, -> { where("prework_end_date >= ?", DateTime.now) }
  scope :signed_up_this_week, -> { where("created_at >= ?", DateTime.now.beginning_of_week) }
  scope :signed_up_last_week, -> { where("created_at <= ?", DateTime.now.last_week.end_of_week)
                                  .where("created_at >= ?", DateTime.now.last_week.beginning_of_week) }
  scope :signed_up_this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :signed_up_last_month, -> { where( 'created_at > ? AND created_at < ?', 
                                    Date.today.last_month.beginning_of_month, 
                                    Date.today.beginning_of_month )}    

  # Set remote students to admitted and set graduation date by default
  def set_admitted!
    if remote?
      update(admitted: true, start_date: Date.today.to_datetime, 
            graduation_date: (Date.today + 1.month).to_datetime, remaining_mentor_sessions: 4, 
            bootstrap_access: true, ruby_access: true)
    elsif immersive?
      update(admitted: true, start_date: Date.today.to_datetime, 
            graduation_date: (Date.today + 2.month).to_datetime, bootstrap_access: true, ruby_access: true)
    end
  end

  # Override devise method for Oauth
  def self.new_with_session(params, session)    
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_omniauth(auth)    
    where(auth.slice(:provider, :uid).to_hash).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid      
      user.email = auth.info.email      
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.avatar = auth.info.image # assuming the user model has an image
    end
  end

  # If sign in through Oauth, don't require password
  def password_required?
    super && provider.blank?
  end

  # Don't require update with password if Oauth
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def send_prework_finished_message
    return if admitted
    UserMailer.prework_finished(self).deliver_now
  end

  def self.declined_today
    where("prework_end_date <= ? AND prework_end_date > ?", 
                      DateTime.now, DateTime.now - 1.day)
    .where(admitted: false)
  end

  def send_prework_reminders
    return if admitted || prework_end_date.nil?
    UserMailer.prework_reminder(self, (self.prework_end_date - DateTime.now).to_i / 86400).deliver_now
  end

  def send_slack
    Slack.chat_postMessage(text: 'New user ' + first_name + " " + last_name + " has signed up!",
          username: 'TECHRISE Bot',
          channel: "#user_signup_alerts",
          icon_emoji: ":smile_cat:") if Rails.env.production?
  end

  def has_started_prework?
    !prework_start_time.nil?
  end

  def has_access_to?(lesson)
    self[lesson + "_access"] ? true : false
  end

  def has_access?
    mentor || admin || admitted || ( prework_end_date && prework_end_date > DateTime.now )
  end

  def start_prework!
    update(prework_start_time: DateTime.now, prework_end_date: DateTime.now + 4.days)
  end

  def update_name!
    self.name = self.first_name + " " + self.last_name
  end

  def last_lesson
    self.progressions.order('created_at DESC').first
  end

  private

  def is_student?
    return false if mentor || admin
    true
  end

end
