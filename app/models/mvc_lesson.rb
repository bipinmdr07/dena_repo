class MvcLesson < ActiveRecord::Base

  COURSE_TITLE = "Understand MVC"

  LESSON_LENGTH = 7

  DURATION = 15

  PERIOD = "3 ~ 4"

  LESSONS = [
    ["Introduction to MVC", 
      [
        [1, "What is MVC?"],
        [2, "The Model"],
        [3, "The View"],
        [4, "The Controller"]
      ]
    ],
    ["Routes", 
      [
        [1, "rake routes"],
        [2, "routes.rb"]
      ]
    ],
    ["Controllers and Views", 
      [
        [1, "Instance Variables in the Controller"],
        [2, "What do web developers do?"],
        [3, "What language should I learn?"],
        [4, "Overview of languages and tools"]
      ]
    ],
    ["The Model",
      [
        [5, "Common Model Methods"]
      ]
    ],
    ["Migrations", 
      [
        [1, "What is schema.rb?"],
        [2, "rake db:migrate"]
      ]
    ],
    ["MVC Wrap Up", 
      [
        [1, "MVC Overview"]
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
