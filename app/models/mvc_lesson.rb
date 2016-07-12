class MvcLesson < ActiveRecord::Base

  COURSE_TITLE = "Understand MVC"

  LESSON_LENGTH = 7

  DURATION = 15

  PERIOD = "3 ~ 4"

  LESSONS = [
    ["Introduction to MVC", 
      [
        [1, "What is MVC?"],
        [2, "Overview of how everything works together"],
        [3, "Routes"],
        [4, "The Controller"]
      ]
    ],
    ["Routes", 
      [
        [5, "rake routes"],
        [6, "routes.rb"]
      ]
    ],
    ["Controllers and Views", 
      [
        [7, "Instance Variables in the Controller"],
        [8, "What do web developers do?"],
        [9, "What language should I learn?"],
        [10, "Overview of languages and tools"]
      ]
    ],
    ["The Model",
      [
        [11, "Common Model Methods"]
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
