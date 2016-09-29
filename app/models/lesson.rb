class Lesson < ActiveRecord::Base
  Chapter = Struct.new(:title)
  Lesson = Struct.new(:id, :title, :chapter)

  def self.lesson_length
    self::LESSONS.length
  end
end
