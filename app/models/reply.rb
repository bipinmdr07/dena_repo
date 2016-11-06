class Reply < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :question_id, :user_id, :content, presence: true

  delegate :name, :email, :avatar, :mentor, to: :user, prefix: true
  delegate :url_helpers, to: 'Rails.application.routes' 

  after_create :create_notifications
  after_create :send_notifications

  private

  def create_notifications
    (question.users.uniq + [question.user] - [user]).each do |user_to_notify|
      Notification.create(recipient: user_to_notify, actor: user, action: "replied to", notifiable: question)
    end
  end

  def send_notifications
    send_slack_notifications
    send_email_notifications
  end

  def send_slack_notifications
    Slack.chat_postMessage(text: 'New reply by ' + user_name + '. View it <' + url_helpers.question_url(question.id) + '|here >.', 
        username: 'TECHRISE Bot', 
        channel: "#forum_questions", 
        icon_emoji: ":smile_cat:") if Rails.env.production?
  end

  def send_email_notifications
    UserMailer.new_reply(question: question, email: question.user_email).deliver_later
  end
end
