class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  mount_uploader :avatar, AvatarUploader

  has_many :cards, dependent: :destroy
  has_many :progressions, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :submission_replies, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :mentor_sessions
  has_many :student_sessions

  validates :first_name, :last_name, presence: true

  before_save :update_name!
  after_create :send_slack

  scope :admitted, -> { where(admitted: true) }
  scope :active_prework_students, -> { where("prework_end_date > ?", DateTime.now) }
  scope :signed_up_this_week, -> { where("created_at >= ?", DateTime.now.beginning_of_week) }
  scope :signed_up_last_week, -> { where("created_at <= ?", DateTime.now.last_week.end_of_week)
                                  .where("created_at >= ?", DateTime.now.last_week.beginning_of_week) }
  scope :signed_up_this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :signed_up_last_month, -> { where( 'created_at > ? AND created_at < ?', 
                                    Date.today.last_month.beginning_of_month, 
                                    Date.today.beginning_of_month )}

  def send_slack
    Slack.chat_postMessage(text: 'New user ' + first_name + " " + last_name + " has signed up!", 
          username: 'TECHRISE Bot', 
          channel: "#user_signup_alerts", 
          icon_emoji: ":smile_cat:") if Rails.env.production?
  end

  def has_access?
    mentor || admin || admitted || ( prework_end_date && prework_end_date > DateTime.now )
  end

  def start_prework
    update(prework_start_time: Date.today, prework_end_date: Date.today + 4.days)
  end

  def update_name!
    self.name = self.first_name + " " + self.last_name
  end

  def last_lesson
    self.progressions.order('created_at DESC').first
    # PublicActivity::Activity.where(owner_id: mentee_id, key: 'progression.create').order('created_at DESC').first
  end
end
