class QuizCategory < ActiveRecord::Base
  has_many :quiz_problems

  validates :name, presence: true
end
