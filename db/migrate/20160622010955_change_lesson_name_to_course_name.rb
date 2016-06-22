class ChangeLessonNameToCourseName < ActiveRecord::Migration
  def change
    rename_column :progressions, :lesson_name, :course_name
    remove_index :progressions, [:user_id, :lesson_id]
    remove_index :progressions, :lesson_id
    add_index :progressions, [:user_id, :course_name]
    add_index :progressions, :course_name
  end
end
