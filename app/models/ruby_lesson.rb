class RubyLesson < ActiveRecord::Base
  COURSE_TITLE = "Ruby Fundamentals"

  LESSON_LENGTH = 3

  DURATION = 15

  PERIOD = "1"

  LESSONS = [
    ["Learning the Basics of Ruby", 
      [
        [1, "Introduction to Ruby"],
        [2, "Ruby Fundamentals"],
        [3, "Foobar Problem"]
      ]
    ]
  ]

end
