class CommandLineLesson < ActiveRecord::Base
  COURSE_TITLE = "Become a Command Line Ninja"

  LESSON_LENGTH = 1

  DURATION = 3

  PERIOD = "1"

  LESSONS = [
    ["Become a Command Line Ninja", 
      [
        [1, "Learn the Command Line"]
      ]
    ]
  ]
end
