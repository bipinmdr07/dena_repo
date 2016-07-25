class CommandLineLesson < ActiveRecord::Base
  COURSE_TITLE = "Become a Command Line Ninja"

  LESSON_LENGTH = 1

  DURATION = 3

  PERIOD = "1"

  LESSONS = [
    ["Command Line Basics", 
      [
        [1, "4 Commands You Need to Know"]
      ]
    ],
    ["Become a Command Line Ninja (Optional)", 
      [
        [2, "Learn the Command Line"]
      ]
    ]
  ]
end
