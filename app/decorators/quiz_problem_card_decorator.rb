class QuizProblemCardDecorator
  def initialize(quiz_problem_card)
    @quiz_problem_card = quiz_problem_card
  end

  def id
    @quiz_problem_card.quiz_problem.id
  end

  def quiz_problem
    @quiz_problem_card.quiz_problem
  end

  def question
    @quiz_problem_card.question
  end

  def quiz_options
    @quiz_problem_card.quiz_options
  end

  def course_name
    @quiz_problem_card.course_name
  end

  def lesson_id
    @quiz_problem_card.lesson_id
  end

end