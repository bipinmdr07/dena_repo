class CreateSubmissionReplies < ActiveRecord::Migration
  def change
    create_table :submission_replies do |t|
    	t.integer  "user_id"
	    t.integer  "comment_id"
	    t.string   "content"
      t.timestamps null: false
    end
  end
end
