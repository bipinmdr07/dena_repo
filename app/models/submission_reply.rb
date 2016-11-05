class SubmissionReply < ApplicationRecord
	belongs_to :submission
  belongs_to :user

  validates :submission_id, :user_id, :content, presence: true

  delegate :name, :email, :avatar, :mentor, to: :user, prefix: true

  after_create :create_notifications
  after_create :send_notifications

  private

  def send_notifications
    send_email_notification
    send_slack_notification
  end

  def send_slack_notification
    Slack.chat_postMessage(text: 'New reply by ' + user_name + '! View it <' + Rails.application.routes.url_helpers.submission_url(self) + '|here>.', 
        username: 'TECHRISE Bot', 
        channel: "#forum_questions", 
        icon_emoji: ":smile_cat:") if Rails.env.production?
  end 

  def send_email_notification
    UserMailer.new_submission_reply(submission: submission, email: submission.user_email).deliver_later
  end

  def create_notifications
    (submission.users.uniq + [submission.user] - [user]).each do |user_to_notify|
      Notification.create(recipient: user_to_notify, actor: user, action: "replied to", notifiable: submission)
    end
  end
end
