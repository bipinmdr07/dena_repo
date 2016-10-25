class AddQuizCategoryRatingToQuizSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_reference :quiz_submissions, :quiz_category_rating, foreign_key: true, index: true
  end
end
