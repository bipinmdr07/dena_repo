class Submission < ApplicationRecord
  belongs_to :user
	has_many :submission_replies, dependent: :destroy
  has_many :users, through: :submission_replies

  validates :title, :content, :lesson_id, :user_id, :course_name, presence: true
  validates :course_name, uniqueness: { scope: [:lesson_id, :user_id] }

  delegate :name, :email, :avatar, :admitted, :mentor, to: :user, prefix: true
  delegate :url_helpers, to: 'Rails.application.routes' 

  scope :approved, -> { where(approved: true) }
  scope :unapproved, -> { where(approved: false) }

  after_create :send_notifications

  private

  def send_notifications
    send_email_notification
    send_slack_notification
  end

  def send_email_notification
    UserMailer.new_submission(self).deliver_later
  end

  def send_slack_notification
    Slack.chat_postMessage(text: 'New submission by ' + user_name + '! View it <' + url_helpers.submission_url(self) + '|here>.', 
                           username: 'TECHRISE Bot', channel: "#forum_questions", 
                           icon_emoji: ":smile_cat:") if Rails.env.production?
  end
end
