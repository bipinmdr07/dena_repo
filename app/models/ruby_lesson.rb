class RubyLesson < ActiveRecord::Base
  COURSE_TITLE = "Introduction to Ruby"

  LESSON_LENGTH = 10

  LESSONS = [
    ["Welcome to the World of Ruby", 
      [
        [1, "Introduction to Ruby"],
        [2, "Get Started"]
      ]
    ]
  ]

end
