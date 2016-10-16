class QuizProblemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @quiz_problems = QuizProblem.where(lesson_id: params[:lesson_id], course_name: params[:course_name])
                                .includes(:quiz_options).randomize
  end
end
