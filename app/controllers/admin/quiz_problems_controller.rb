class Admin::QuizProblemsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def create
    @quiz_problem = QuizProblem.new(quiz_problem_params.except(:options)) 

    if @quiz_problem.save

      create_quiz_options

      respond_to do |format|
        format.json { render json: @quiz_problem }        
      end   
    else
      respond_to do |format|
        format.json { render json: :unprocessable_entity }        
      end
    end
  end

  private

  def create_quiz_options
    JSON.parse(quiz_problem_params[:options]).each do |option|   
      next if option["content"].nil? || option["correct"].nil?
      @quiz_problem.quiz_options.create(option)
    end
  end

  def quiz_problem_params
    params.require(:quiz_problem).permit(:question, :course_name, :lesson_id, :options)
  end
end
