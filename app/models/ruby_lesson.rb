class RubyLesson < ActiveRecord::Base
  COURSE_TITLE = "Ruby Fundamentals"

  LESSON_LENGTH = 3

  LESSONS = [
    ["Ruby Fundamentals", 
      [
        [1, "Introduction to Ruby"],
        [2, "Ruby Fundamentals"],
        [3, "Foobar Problem"]
      ]
    ]
  ]

end
