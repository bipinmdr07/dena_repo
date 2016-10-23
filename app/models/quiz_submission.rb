class QuizSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :quiz_problem
  belongs_to :quiz_category_rating, counter_cache: true
    
  delegate :quiz_category, to: :quiz_problem, allow_nil: false

  validates :quiz_problem, :user, presence: true

  def calculate_score(args)
    checked_option_ids = args.fetch(:checked_option_ids)

    return 0 if checked_option_ids.empty?

    checked_options = QuizOption.where(id: checked_option_ids)

    checked_options.correct_answers.count.to_f / checked_options.count.to_f * 100    
  end
end
