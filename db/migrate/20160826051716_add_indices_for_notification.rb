class AddIndicesForNotification < ActiveRecord::Migration
  def change
    add_index :notifications, :recipient_id
    add_index :notifications, [:recipient_id, :read_at]
    add_index :notifications, [:recipient_id, :created_at]
    add_index :notifications, :actor_id
    add_index :notifications, :notifiable_id    
  end
end
