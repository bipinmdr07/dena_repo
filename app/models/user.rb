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

  def has_access?
    mentor || admin || admitted || ( prework_end_date && prework_end_date > DateTime.now )
  end

  def start_prework!
    update(prework_start_time: Date.today, prework_end_date: Date.today + 2.weeks)
  end

  def update_name!
    self.name = self.first_name + " " + self.last_name
  end 
end
