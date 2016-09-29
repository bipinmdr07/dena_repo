class Lesson < ActiveRecord::Base
  def self.lesson_length
    self::LESSONS.last.last.last[0]
  end
end
