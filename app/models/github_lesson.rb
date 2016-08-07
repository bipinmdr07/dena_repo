class GithubLesson < ActiveRecord::Base
  COURSE_TITLE = "Github - Master your Github Chops"

  SUBMISSION_COUNT = 0

  LESSON_LENGTH = 4

  DURATION = 8

  PERIOD = "7"

  LESSONS = [
    ["Basic Git",
      [
        [1, "Git Real"],
        [2, "Try Git"],
        [3, "Git - the simple guide"]
      ]
    ],
    ["Extra Credit: Pro Git (Optional)",
      [
        [4, "Going Deeper"]
      ]
    ],
  ]


end
