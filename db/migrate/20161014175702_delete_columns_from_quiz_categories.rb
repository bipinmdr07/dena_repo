class DeleteColumnsFromQuizCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :quiz_categories, :lesson_id
    remove_column :quiz_categories, :course_name
  end
end
