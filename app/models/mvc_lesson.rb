class MvcLesson < Lesson

  COURSE_TITLE = "Understand MVC"

  DURATION = 10

  PERIOD = "3 ~ 4"

  CHAPTERS = [
    Chapter.new("Introduction to MVC"),
    Chapter.new("HTTP Methods"),
    Chapter.new("Model Methods"),
    Chapter.new("Migrations"),
    Chapter.new("Applying what you have learned")
  ]

  LESSONS = [
    Lesson.new(1, "What is MVC?", CHAPTERS[0]),
    Lesson.new(2, "Overview of how everything works together", CHAPTERS[0]),

    Lesson.new(3, "Overview of HTTP Methods", CHAPTERS[1]),

    Lesson.new(4, "Rails for Zombies", CHAPTERS[2]),

    Lesson.new(5, "What is schema.rb?", CHAPTERS[3]),
    Lesson.new(6, "Adding and Updating Database Columns", CHAPTERS[3]),
    Lesson.new(7, "Your turn!", CHAPTERS[4])
  ]

end
