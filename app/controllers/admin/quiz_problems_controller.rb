class Admin::QuizProblemsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def create
    @quiz_problem = QuizProblem.new(quiz_problem_params.except(:options))

    if options_exist? && build_quiz_options && @quiz_problem.save      
      @quiz_problem.quiz_options.map(&:save)      

      respond_to do |format|
        format.json { render json: @quiz_problem }        
      end   
    else
      respond_to do |format|
        format.json { render json: {errors: @quiz_problem.errors.full_messages}, status: :unprocessable_entity }        
      end
    end
  end

  private

  def options_exist?
    return true unless quiz_problem_params[:options].nil?
    @quiz_problem.errors.add(:quiz_options, "must exist.")
    false
  end

  def build_quiz_options
    has_correct_answer = false

    JSON.parse(quiz_problem_params[:options]).each do |option|   
      next if option["content"].nil? || option["correct"].nil?
      @quiz_problem.quiz_options.build(option)
      has_correct_answer = true if option["correct"] == "true"
    end

    return true if has_correct_answer
    @quiz_problem.errors.add(:quiz_options, "must have at least one correct answer.")
    false
  end

  def quiz_problem_params
    params.require(:quiz_problem).permit(:question, :course_name, :lesson_id, :options)
  end
end
