class QuizCategory < ActiveRecord::Base
  has_many :quiz_problems
end
