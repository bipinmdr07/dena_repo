class QuizProblemsController < ApplicationController
  before_action :authenticate_user!

  def index
    due_quiz_problem_cards = current_user.quiz_problem_cards
                                         .joins(:quiz_problem)
                                         .where.not(quiz_problems: {lesson_id: params[:lesson_id], course_name: params[:course_name]})
                                         .today
                                         .map{|card| QuizProblemCardDecorator.new(card)}

    current_quiz_problems = QuizProblem.where(lesson_id: params[:lesson_id], course_name: params[:course_name])                                       
                                       .randomize
                                       .includes(:quiz_options)

    @quiz_problems = due_quiz_problem_cards + current_quiz_problems
  end
end
