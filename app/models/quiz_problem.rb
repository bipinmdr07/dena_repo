require 'exceptions'

class QuizProblem < ActiveRecord::Base
  belongs_to :quiz_category
  has_many :quiz_options, dependent: :destroy
  has_many :quiz_submissions, dependent: :destroy

  validates :question, :lesson_id, :course_name, :quiz_category_id, presence: true

  scope :randomize, -> { order('random()') }

  def save_and_create_quiz_options!(quiz_problem_params)
    self.transaction do
      self.save!

      build_quiz_options(quiz_problem_params)
    end
  end

  private

  def build_quiz_options(quiz_problem_params)
    has_correct_answer = false
    JSON.parse(quiz_problem_params[:options]).each do |option|   
      next if option["content"].blank? || option["correct"].blank?    
      self.quiz_options.create!(option)

      has_correct_answer = true if option["correct"]
    end

    return true if has_correct_answer
    self.errors.add(:quiz_options, "must have at least one correct answer.")
    raise ::Exceptions::MustHaveCorrectAnswerException.new "Must have at least one correct answer"
  end
end

