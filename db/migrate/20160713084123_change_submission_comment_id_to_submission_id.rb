class ChangeSubmissionCommentIdToSubmissionId < ActiveRecord::Migration
  def change
    # rename_column :submission_replies, :submission_comment_id, :submission_id if column? :submission_comment_id
    # add_index :submission_replies, :submission_id
  end
end
