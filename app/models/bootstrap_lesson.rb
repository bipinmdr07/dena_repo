class BootstrapLesson < Lesson
  COURSE_TITLE = "Introduction to Bootstrap"

  DURATION = 2

  PERIOD = "1"

  CHAPTERS = [
    Chapter.new("Create a Simple Landing Page")
  ]

  LESSONS = [
    
    Lesson.new(1, "Introducing Bootstrap", CHAPTERS[0]),
    Lesson.new(2, "Adding Bootstrap to Your Site", CHAPTERS[0]),
    Lesson.new(3, "Adding a Navbar", CHAPTERS[0]),
    Lesson.new(4, "Adding Content", CHAPTERS[0]),
    Lesson.new(5, "Working with the Grid System", CHAPTERS[0]),
    Lesson.new(6, "Adding Some More Content", CHAPTERS[0]),
    Lesson.new(7, "Adding a Footer", CHAPTERS[0]),
    Lesson.new(8, "Finishing Touches", CHAPTERS[0]),
    Lesson.new(9, "CHALLENGE: Host Your Website", CHAPTERS[0])
      
  ]
end
