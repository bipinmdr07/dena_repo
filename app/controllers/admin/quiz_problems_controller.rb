require 'exceptions'

class Admin::QuizProblemsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!  

  rescue_from ::Exceptions::MustHaveCorrectAnswerException, with: :quiz_problem_exception_handler
  rescue_from ActiveRecord::RecordInvalid, with: :exception_handler

  def create    
    @quiz_problem = QuizProblem.new(quiz_problem_params.except(:options))
    @option_builder = QuizOptionBuilder.new(quiz_problem: @quiz_problem, quiz_problem_params: quiz_problem_params)

    if @option_builder.build!
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

  def quiz_problem_exception_handler(error)
    render json: {errors: error.message}, status: :unprocessable_entity
  end

  def exception_handler(error)
    render json: {errors: error.message}, status: :unprocessable_entity
  end

  def quiz_problem_params
    params.require(:quiz_problem).permit(:question, :course_name, :lesson_id, :quiz_category_id, :options)
  end
end
