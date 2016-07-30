class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

  has_many :cards, dependent: :destroy
  has_many :progressions, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :submission_replies, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :mentor_sessions
  has_many :student_sessions

  validates :name, presence: true
end
