class AlgorithmLesson < Lesson

  COURSE_TITLE = "Understanding Data Structures and Algorithms"

  DURATION = 30

  PERIOD = "8 ~ 10"

  CHAPTERS = [
    Chapter.new("Introduction to Data Structures and Algorithms"),
    Chapter.new("Arrays and Linked Lists"),
    Chapter.new("Stacks and Queues"),
    Chapter.new("Hashes"),
    Chapter.new("Trees"),
    Chapter.new("Sorting Algorithms")
  ]

  LESSONS = [
    Lesson.new(1, "Why test?", CHAPTERS[0]),
    Lesson.new(2, "What is RSpec?", CHAPTERS[0]),

    Lesson.new(3, "Setting up your Web Dev Environment", CHAPTERS[1]),
    Lesson.new(4, "Setting Up Git", CHAPTERS[1]),
    Lesson.new(5, "Self-Navigated Lesson: Installing Bootstrap", CHAPTERS[1]),
    Lesson.new(6, "Self-Navigated Lesson: Installing Simple Form", CHAPTERS[1]),
    Lesson.new(8, "Installing RSpec", CHAPTERS[1]),
    Lesson.new(9, "Installing Factory Girl", CHAPTERS[1]),
    Lesson.new(10, "Self Directed Lesson - Adding a Navbar", CHAPTERS[1]),

    Lesson.new(11, "Creating the Posts Controller and Model", CHAPTERS[2]),
    Lesson.new(12, "Setting Up Validations", CHAPTERS[2]),
    Lesson.new(13, "Setting Up Routes", CHAPTERS[2]),
    Lesson.new(14, "Setting up CRUD Actions", CHAPTERS[2]),

    Lesson.new(11, "Creating the Posts Controller and Model", CHAPTERS[3]),
    Lesson.new(12, "Setting Up Validations", CHAPTERS[3]),
    Lesson.new(13, "Setting Up Routes", CHAPTERS[3]),
    Lesson.new(14, "Setting up CRUD Actions", CHAPTERS[3]),

    Lesson.new(15, "Why TDD?", CHAPTERS[4]),
    Lesson.new(16, "Testing the index action", CHAPTERS[4]),
    Lesson.new(17, "Creating New Posts", CHAPTERS[4]),
    Lesson.new(18, "Individual Post Pages", CHAPTERS[4]),
    Lesson.new(19, "Editing Posts", CHAPTERS[4]),
    Lesson.new(20, "Deleting Posts", CHAPTERS[4]),

    Lesson.new(21, "Bubble Sort", CHAPTERS[5]),
    Lesson.new(22, "Selection Sort", CHAPTERS[5]),
    Lesson.new(23, "Insertion Sort", CHAPTERS[5]),
    Lesson.new(24, "Quick Sort", CHAPTERS[5]),
    Lesson.new(25, "Merge Sort", CHAPTERS[5])
  ]
end
