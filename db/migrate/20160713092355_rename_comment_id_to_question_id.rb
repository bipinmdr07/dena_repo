class RenameCommentIdToQuestionId < ActiveRecord::Migration
  def change
    rename_column :replies, :comment_id, :question_id
    add_index :replies, [:question_id, :user_id]
    add_index :replies, :user_id
  end
end
