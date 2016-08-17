class AddResolvedToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :resolved, :boolean, default: false
  end
end
