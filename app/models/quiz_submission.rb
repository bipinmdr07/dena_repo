class QuizSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :quiz_problem
  belongs_to :quiz_category_ranking, counter_cache: true
    
  delegate :quiz_category, to: :quiz_problem, allow_nil: false

  def calculate_score(args)
    checked_options = QuizOption.find(args.fetch(:checked_option_ids)) 

    (checked_options.select{|o| o.correct }.count.to_f / quiz_problem.quiz_options.correct.count.to_f) * 100
  end
end
