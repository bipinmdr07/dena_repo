class RubyCoreLesson < ActiveRecord::Base
  COURSE_TITLE = "Ruby Core Training"

  LESSON_LENGTH = 3

  DURATION = 15

  PERIOD = "3 ~ 4"

  LESSONS = [
    ["Ruby Core Training",
      [
        [1, "Practice, Practice, Practice"]
      ]
    ],
    ["Coding Challenges",
      [
        [2, "Check Palindrome"],
        [3, "String Compressor"]
      ]
    ]
  ]

end
