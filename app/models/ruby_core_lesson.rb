class RubyCoreLesson < ActiveRecord::Base
  COURSE_TITLE = "Ruby Core Training"

  SUBMISSION_COUNT = 0

  LESSON_LENGTH = 2

  DURATION = 15

  PERIOD = "3 ~ 4"

  LESSONS = [
    ["Ruby Core Training",
      [
        [1, "Practice, Practice, Practice"],
        [2, "Codewars"]
      ]
    ]
  ]

end
