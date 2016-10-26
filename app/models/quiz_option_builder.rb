class QuizOptionBuilder
  def initialize(args)
    @quiz_problem = args.fetch(:quiz_problem)
    @quiz_problem_params = args.fetch(:quiz_problem_params)
  end

  def build!
    return false unless options_exist?
    @quiz_problem.save_and_create_quiz_options!(@quiz_problem_params)
  end

  private

  def options_exist?
    return true unless @quiz_problem_params[:options].nil?
    @quiz_problem.errors.add(:quiz_options, "must exist.")
    false
  end
end