class RubyCoreLesson < Lesson
  COURSE_TITLE = "Ruby Core Training"

  DURATION = 15

  PERIOD = "3 ~ 4"

  CHAPTERS = [
    Chapter.new("Ruby Core Training"),
    Chapter.new("Coding Challenges")    
  ]

  LESSONS = [
    Lesson.new(1, "Practice, Practice, Practice", CHAPTERS[0]),

    Lesson.new(2, "Check Palindrome", CHAPTERS[1]),
    Lesson.new(3, "String Compressor", CHAPTERS[1]),
    Lesson.new(4, "Square Each Digits", CHAPTERS[1])
  ]

end
