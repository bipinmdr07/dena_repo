class QuizOption < ActiveRecord::Base
  belongs_to :quiz_problem

  validates :quiz_problem_id, :content, presence: true
  validates_inclusion_of :correct, in: [true, false]

  scope :correct_answers, -> { where(correct: true) }

  def self.randomize
    random = order('random()')
    return random if random.length <= 4

    correct = random.find{|option| option.correct }
    options = random.select{|option| option != correct }[0..2] << correct
    options.shuffle
  end
end
