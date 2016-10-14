class AddSubmissionCountToQuizCategoryRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :quiz_category_ratings, :submission_count, :integer, default: 0
    change_column :quiz_category_ratings, :score, :float, default: 0.0
  end
end
