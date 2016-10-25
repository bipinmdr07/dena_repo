class AddCounterCacheToQuizCategoryRating < ActiveRecord::Migration[5.0]
  def change
    remove_column :quiz_category_ratings, :submission_count
    add_column :quiz_category_ratings, :quiz_submissions_count, :integer, default: 0

    QuizCategoryRating.reset_column_information
    QuizCategoryRating.all.each do |q|
      QuizCategoryRating.update_counters q.id, tasks_count: q.quiz_submissions.length
    end
  end
end
