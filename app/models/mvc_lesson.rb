class MvcLesson < ActiveRecord::Base

  COURSE_TITLE = "Understand MVC"

  LESSON_LENGTH = 7

  DURATION = 5

  PERIOD = "3 ~ 4"

  LESSONS = [
    ["Introduction to MVC", 
      [
        [1, "Congratulations!"],
        [2, "What do web developers do?"],
        [3, "What language should I learn?"],
        [4, "Overview of languages and tools"]
      ]
    ],
    ["The Model",
      [
        [5, "Why use the TECHRISE Flashcard System?"],
        [6, "How to Embed Code with TECHRISE Flashcards"],
        [7, "Guidelines to maximize your learning experience"]
      ]
    ],
    ["The View", 
      [
        [1, "Congratulations!"],
        [2, "What do web developers do?"],
        [3, "What language should I learn?"],
        [4, "Overview of languages and tools"]
      ]
    ],
    ["The Controller", 
      [
        [1, "Congratulations!"],
        [2, "What do web developers do?"],
        [3, "What language should I learn?"],
        [4, "Overview of languages and tools"]
      ]
    ],
    ["MVC Wrap Up", 
      [
        [1, "Congratulations!"],
        [2, "What do web developers do?"],
        [3, "What language should I learn?"],
        [4, "Overview of languages and tools"]
      ]
    ],
    ["What is REST?", 
      [
        [1, "Congratulations!"],
        [2, "What do web developers do?"],
        [3, "What language should I learn?"],
        [4, "Overview of languages and tools"]
      ]
    ]
  ]

end
