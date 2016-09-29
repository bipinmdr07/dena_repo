class RspecBlogLesson < Lesson

  COURSE_TITLE = "Testing Rails Applications with RSpec"

  DURATION = 30

  PERIOD = "5 ~ 6"

  CHAPTERS = [
    Chapter.new("Introduction to RSpec"),
    Chapter.new("Setting up Your App"),
    Chapter.new("Setting up Posts"),
    Chapter.new("TDD - Test Driven Development"),
    Chapter.new("Testing our Rails Application"),
    Chapter.new("Final Touches"),
    Chapter.new("Wrapping Up")
  ]

  LESSONS = [
    Lesson.new(1, "Why test?", CHAPTERS[0]),
    Lesson.new(2, "What is RSpec?", CHAPTERS[0]),

    Lesson.new(3, "Self-Directed Lesson: Setting up your Web Dev Environment", CHAPTERS[1]),
    Lesson.new(4, "Self-Directed Lesson: Setting Up Git", CHAPTERS[1]),
    Lesson.new(5, "Self-Directed Lesson: Installing Bootstrap", CHAPTERS[1]),
    Lesson.new(6, "Self-Directed Lesson: Installing Simple Form", CHAPTERS[1]),
    Lesson.new(7, "Self Directed Lesson - Adding a Navbar", CHAPTERS[1]),
    Lesson.new(8, "Installing RSpec", CHAPTERS[1]),

    Lesson.new(9, "Self-Directed Lesson: Creating the Posts Controller and Model", CHAPTERS[2]),
    Lesson.new(10, "Self-Directed Lesson: Setting Up Routes", CHAPTERS[2]),
    Lesson.new(11, "Self-Directed Lesson: Setting up CRUD Actions", CHAPTERS[2]),

    Lesson.new(12, "What is TDD?", CHAPTERS[3]),

    Lesson.new(13, "Testing the index action", CHAPTERS[4]),
    Lesson.new(14, "Testing the show action", CHAPTERS[4]),
    Lesson.new(15, "Self-Directed Lesson: Writing the show action", CHAPTERS[4]),
    Lesson.new(16, "Testing the new action", CHAPTERS[4]),
    Lesson.new(17, "Testing the create action - Part 1", CHAPTERS[4]),
    Lesson.new(18, "Self-Directed Lesson: Setting Up Validations", CHAPTERS[4]),
    Lesson.new(19, "Testing the create action - Part 2", CHAPTERS[4]),
    Lesson.new(20, "Self-Directed Lesson: Testing the edit action", CHAPTERS[4]),
    Lesson.new(21, "Testing the update action", CHAPTERS[4]),
    Lesson.new(22, "Testing the destroy action", CHAPTERS[4]),
    Lesson.new(23, "Model Tests", CHAPTERS[4]),

    Lesson.new(24, "Self-Directed Lesson: Tidying things up", CHAPTERS[5]),

    Lesson.new(25, "TDD: Final Thoughts", CHAPTERS[6])
  ]

end
