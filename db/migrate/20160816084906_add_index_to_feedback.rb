class AddIndexToFeedback < ActiveRecord::Migration
  def change
    add_index :feedbacks, :user_id
  end
end
