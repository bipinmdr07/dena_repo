class MicropostsLesson < Lesson
  COURSE_TITLE = "Microposts"
  DURATION = 5

  PERIOD = "3"

  CHAPTERS = [
    Chapter.new("It's your turn!")
  ]

  LESSONS = [
    Lesson.new(1, "Applying the things you have learned", CHAPTERS[0])
  ]
end
