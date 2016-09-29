FactoryGirl.define do
  factory :notification do
    recipient_id 1
    actor_id 1
    read_at "2016-08-25 15:30:26"
    action "replied to"
    notifiable_id 1
    notifiable_type "Question"
  end
end
