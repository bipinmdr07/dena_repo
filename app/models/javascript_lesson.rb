class JavascriptLesson < Lesson
  COURSE_TITLE = "Basic Javascript/jQuery - Manipulate the web page"

  DURATION = 10

  PERIOD = "7"

  CHAPTERS = [
    Chapter.new("Basic Javascript"),
    Chapter.new("Basic jQuery")
  ]

  LESSONS = [
    Lesson.new(1, "Learning the Basics", CHAPTERS[0]),
    
    Lesson.new(2, "Using jQuery", CHAPTERS[1])
  ]

end
