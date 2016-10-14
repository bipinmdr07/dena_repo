class AddQuizCategoryIdToQuizProblems < ActiveRecord::Migration[5.0]
  def change
    add_column :quiz_problems, :quiz_category_id, :integer
    add_index :quiz_problems, :quiz_category_id
  end
end
