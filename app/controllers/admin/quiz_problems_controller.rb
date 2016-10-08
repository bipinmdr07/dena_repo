class Admin::QuizProblemsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def create
    @quiz_problem = QuizProblem.new(quiz_problem_params)

    if @quiz_problem.save
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

  def quiz_problem_params
    params.require(:quiz_problem).permit(:question, :course_name, :lesson_id)
  end
end
