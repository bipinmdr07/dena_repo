class AddCourseNameToComment < ActiveRecord::Migration
  def change
    add_column :comments, :course_name, :string
    add_column :submissions, :course_name, :string
    add_column :submissions, :title, :string
    add_column :submissions, :description, :string
    add_column :submissions, :lesson, :integer
    add_column :submissions, :user_id, :integer
  end
end
