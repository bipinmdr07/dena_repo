class QuizProblemsController < ApplicationController
  before_action :authenticate_user!

  def index
    due_quiz_problem_cards = current_user.quiz_problem_cards.today.includes(:quiz_problem).map{|card| QuizProblemCardDecorator.new(card)}
    current_quiz_problems = QuizProblem.where(lesson_id: params[:lesson_id], course_name: params[:course_name])
                                .includes(:quiz_options).randomize
    @quiz_problems = due_quiz_problem_cards + current_quiz_problems
  end
end
