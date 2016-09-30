require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do
  describe "POST #mark_as_read" do
    it "marks all unread notifications of current_user as read" do
      actor = FactoryGirl.create(:user)
      recipient = FactoryGirl.create(:user)

      sign_in recipient

      unread_notification_1 = FactoryGirl.create(:notification,
                                          recipient_id: recipient.id,
                                          actor_id: actor.id,
                                          read_at: nil)
      unread_notification_2 = FactoryGirl.create(:notification,
                                          recipient_id: recipient.id,
                                          actor_id: actor.id,
                                          read_at: nil)

      post :mark_as_read
      unread_notification_1.reload
      unread_notification_2.reload

      expect(unread_notification_1.read_at).to be_within(1.second).of(Time.zone.now)
      expect(unread_notification_2.read_at).to be_within(1.second).of(Time.zone.now)
    end
  end
end
