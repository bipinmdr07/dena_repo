class ForumIdRemove < ActiveRecord::Migration
  def change
  	remove_column :submission_comments, :forum_id
  	add_column :submission_comments, :submission_id, :integer
  	add_index :submission_comments, :submission_id
  end
end
