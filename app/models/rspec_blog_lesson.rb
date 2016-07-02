class RspecBlogLesson < ActiveRecord::Base

  COURSE_TITLE = "Testing Rails Applications with RSpec"

  LESSON_LENGTH = 20

  DURATION = 30

  PERIOD = "5 ~ 6"

  LESSONS = [
    ["Introduction to RSpec", 
      [
        [1, "Why test?"],
        [2, "What is RSpec?"]
      ]
    ],
    ["Setting up Your App", 
      [
        [3, "Setting up your Web Dev Environment"],
        [4, "Setting Up Git"],
        [5, "Self-Navigated Lesson: Installing Bootstrap"],
        [6, "Self-Navigated Lesson: Installing Simple Form"],
        [8, "Installing RSpec"],
        [9, "Installing Factory Girl"],
        [10, "Self Directed Lesson - Adding a Navbar"]
      ]
    ],
    ["Setting up Posts",
      [ 
        [11, "Creating the Posts Controller and Model"],
        [12, "Setting Up Validations"],
        [13, "Setting Up Routes"],
        [14, "Setting up CRUD Actions"]
      ]
    ],
    ["TDD - Test Driven Development",
      [
        [15, "Why TDD?"]
      ]
    ],
    ["Writing Tests",
      [
        [16, "Testing the index action"],
        [17, "Creating New Posts"],
        [18, "Individual Post Pages"],
        [19, "Editing Posts"],
        [20, "Deleting Posts"]
      ]
    ]
  ]

end
