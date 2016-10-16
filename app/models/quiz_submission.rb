class QuizSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :quiz_problem
  belongs_to :quiz_category_ranking, counter_cache: true
    
  delegate :quiz_category, to: :quiz_problem, allow_nil: false

  def calculate_score(args)
    checked_option_ids = args.fetch(:checked_option_ids)

    checked_options = QuizOption.where(id: checked_option_ids)

    correct_option_count = quiz_problem.quiz_options.correct_answers.count.to_f

    correct_selected_options = checked_options.select{|o| o.correct }.count.to_f

    if correct_selected_options == 0 && correct_option_count == 0
      return 100
    elsif correct_selected_options == 0 && correct_option_count != 0
      return 0
    elsif checked_options.empty? && correct_option_count == 0
      return 100
    elsif checked_options.empty? && correct_option_count != 0
      return 0
    else
      (checked_options.select{|o| o.correct }.count.to_f / quiz_problem.quiz_options.correct_answers.count.to_f) * 100
    end
  end
end
