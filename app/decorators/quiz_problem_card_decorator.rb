class QuizProblemCardDecorator
  def initialize(quiz_problem_card)
    @quiz_problem_card = quiz_problem_card
  end

  def id
    @quiz_problem_card.quiz_problem.id
  end

  def question
    @quiz_problem_card.quiz_problem.question
  end

  def quiz_options
    @quiz_problem_card.quiz_problem.quiz_options
  end
end