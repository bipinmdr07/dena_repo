class JavascriptLesson < ActiveRecord::Base
  COURSE_TITLE = "Basic Javascript/jQuery - Manipulate the web page"

  LESSON_LENGTH = 2

  DURATION = 10

  PERIOD = "7"

  LESSONS = [
    ["Basic JavaScript", 
      [
        [1, "Learning the Basics"]
        
      ]
    ],
    ["Basic jQuery",
      [
        [2, "Using jQuery"]
      ]
    ]
  ]

end
