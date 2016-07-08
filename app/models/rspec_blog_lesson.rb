class RspecBlogLesson < ActiveRecord::Base

  COURSE_TITLE = "Testing Rails Applications with RSpec"

  LESSON_LENGTH = 18

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
        [3, "Self-Directed Lesson: Setting up your Web Dev Environment"],
        [4, "Self-Directed Lesson: Setting Up Git"],
        [5, "Self-Directed Lesson: Installing Bootstrap"],
        [6, "Self-Directed Lesson: Installing Simple Form"],
        [7, "Self Directed Lesson - Adding a Navbar"],
        [8, "Installing RSpec"]
      ]
    ],
    ["Setting up Posts",
      [ 
        [9, "Self-Directed Lesson: Creating the Posts Controller and Model"],
        [10, "Self-Directed Lesson: Setting Up Routes"],
        [11, "Self-Directed Lesson: Setting up CRUD Actions"]
      ]
    ],
    ["TDD - Test Driven Development",
      [
        [12, "What is TDD?"]
      ]
    ],
    ["Testing our Rails Application",
      [
        [13, "Testing the index action"],
        [14, "Testing the show action"],
        [15, "Testing the new action"],
        [16, "Testing the create action"],
        [17, "Setting Up Validations"],
        [18, "Showing Posts"],
        [19, "Editing Posts"],
        [20, "Deleting Posts"]
      ]
    ]
  ]

end
