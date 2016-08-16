class AddCourseNameAndLessonIdToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :course_name, :string
    add_column :feedbacks, :lesson_id, :integer
  end
end
