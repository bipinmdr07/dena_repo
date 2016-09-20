class AddMoreIndexes < ActiveRecord::Migration
  def change
    add_index :student_sessions, :user_id
    add_index :student_sessions, :mentor_id
    add_index :student_sessions, :mentor_session_id
    remove_index "replies", ["question_id", "user_id"]
    add_index "questions", "course_name"
    add_index "questions", "lesson_id"
    add_index :submissions, :lesson_id
    add_index :users, :mentor_id    
    drop_table :student_questions
    drop_table :submission_comments
    drop_table :forums
    drop_table :comments
    add_index :mentor_sessions, :mentor_id
    add_index :mentor_sessions, :user_id
  end
end
