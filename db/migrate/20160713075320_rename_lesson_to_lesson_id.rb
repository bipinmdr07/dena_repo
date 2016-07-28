class RenameLessonToLessonId < ActiveRecord::Migration
  def change
    rename_column :submissions, :lesson, :lesson_id
    add_index :submissions, [:course_name, :lesson_id]
    add_index :submissions, :user_id
    add_index :submissions, :course_name
  end
end
