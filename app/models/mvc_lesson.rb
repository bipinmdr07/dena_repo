class MvcLesson < ActiveRecord::Base

  COURSE_TITLE = "Understand MVC"

  LESSON_LENGTH = 7

  DURATION = 15

  PERIOD = "3 ~ 4"

  LESSONS = [
    ["Introduction to MVC", 
      [
        [1, "What is MVC?"],
        [2, "Overview of how everything works together"]
      ]
    ],
    ["HTTP Methods", 
      [
        [3, "Overview of HTTP Methods"]
      ]
    ],
    ["Model Methods", 
      [
        [4, "Rails for Zombies"]
      ]
    ],
    ["Migrations",
      [
        [5, "What is schema.rb?"],
        [6, "Adding and Updating Database Columns"]
      ]
    ],
    ["Migrations", 
      [
        [12, "What is schema.rb?"],
        [13, "rake db:migrate"]
      ]
    ],
    ["MVC Wrap Up", 
      [
        [14, "MVC Overview"]
      ]
    ],
    ["What is REST?", 
      [
        [15, "Congratulations!"],
        [2, "What do web developers do?"],
        [3, "What language should I learn?"],
        [4, "Overview of languages and tools"]
      ]
    ]
  ]

end
