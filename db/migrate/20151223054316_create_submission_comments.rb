class CreateSubmissionComments < ActiveRecord::Migration
  def change
    create_table :submission_comments do |t|
	    t.integer  "forum_id"
	    t.string   "title"
	    t.text     "description"
	    t.integer  "lesson"
    	t.integer  "user_id"
      t.timestamps null: false
    end
    remove_column :submission_replies, :comment_id
    add_column :submission_replies, :submission_comment_id, :integer
    add_index :submission_comments, [:forum_id, :user_id]
    add_index :submission_replies, [:user_id, :submission_comment_id]
  end
end
