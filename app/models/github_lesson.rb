class GithubLesson < ActiveRecord::Base
  COURSE_TITLE = "Github - Master your Github Chops"

  LESSON_LENGTH = 4

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
