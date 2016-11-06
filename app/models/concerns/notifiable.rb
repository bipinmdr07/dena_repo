module Notifiable
  extend ActiveSupport::Concern

  included do
    delegate :url_helpers, to: 'Rails.application.routes'
    after_create :send_notifications
    after_create :create_notifications
  end

  private

  def create_notifications
    (notifiable.users.uniq + [notifiable.user] - [user]).each do |user_to_notify|
      Notification.create(recipient: user_to_notify, actor: user, action: "replied to", notifiable: notifiable)
    end
  end

  def send_notifications
    send_slack_notifications
    send_email_notifications
  end

  def send_slack_notifications    
    Slack.chat_postMessage(text: "New #{self.class.name.underscore.humanize.downcase} by #{user_name}. View it < #{url_helpers.send notifiable.class.name.underscore.humanize.downcase+'_url', notifiable.id} |here >.", 
        username: 'TECHRISE Bot', 
        channel: "#forum_questions", 
        icon_emoji: ":smile_cat:") if Rails.env.production?
  end

  def send_email_notifications
    mailer = UserMailer.send "new_#{self.class.name.underscore}", "#{notifiable.class.name.downcase}": notifiable, email: notifiable.user_email
    mailer.deliver_later
  end
end
