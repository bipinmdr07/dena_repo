class GithubLesson < Lesson
  COURSE_TITLE = "Github - Master your Github Chops"

  DURATION = 8

  PERIOD = "7"

  CHAPTERS = [
    Chapter.new("Basic Git"),
    Chapter.new("Extra Credit: Pro Git (Optional)")
  ]

  LESSONS = [
    Lesson.new(1, "Git Real", CHAPTERS[0]),
    Lesson.new(2, "Try Git", CHAPTERS[0]),
    Lesson.new(3, "Git - the simple guide", CHAPTERS[0]),

    Lesson.new(4, "Going Deeper", CHAPTERS[1])
  ]


end
