require 'exceptions'

class Admin::QuizProblemsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!  

  rescue_from ::Exceptions::MustHaveCorrectAnswerException, with: :quiz_problem_exception_handler
  rescue_from ActiveRecord::RecordInvalid, with: :exception_handler

  def index
    @quiz_problems = QuizProblem.order(:lesson_id).group_by(&:course_name)
  end

  def create
    return unless atleast_4_options_exist?

    @quiz_problem = QuizProblem.new(quiz_problem_params.except(:options))

    parse_problem

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

  def update
    @quiz_problem = QuizProblem.find(params[:id])

    if @quiz_problem.update(quiz_problem_params)
      respond_to do |format|
        format.json { render json: @quiz_problem.question.to_json }
      end
    else
      respond_to do |format|
        format.json { render json: { errors: @quiz_problem.errors}, status: :unprocessable_entity }
      end
    end
  end

  private

  def atleast_4_options_exist?
    options = quiz_problem_params[:options]

    return true unless options.nil? || JSON.parse(options).length < 4
    
    respond_to do |format|
      format.json { render json: {errors: ["There must be at least 4 options for each problem."]}, status: :unprocessable_entity } 
    end    

    false
  end

  def parse_problem
    @quiz_problem.question = MarkdownParser.new(@quiz_problem.question).parsed
  end

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
