class PreviousLessonUrlBuilder
  attr_reader :forum

  def initialize(forum)
    @forum = forum
  end

  def url
    "/" + course_name + "/" + forum.lesson_id.to_s
  end

  private

  def course_name
    forum.course_name.underscore + "s"
  end
end