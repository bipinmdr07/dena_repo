json.array! @notifications do |notification|
  json.actor notification.actor.name
  json.actor_photo_url notification.actor.avatar.url
  json.action notification.action
  json.read_at notification.read_at
  json.created_at notification.created_at
  json.notifiable do
    json.type "your #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.url "/" + notification.notifiable.class.to_s.underscore.humanize.downcase + "s/" + (notification.notifiable_id).to_s
end
