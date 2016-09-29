class RubyLesson < Lesson
  COURSE_TITLE = "Ruby Fundamentals"

  DURATION = 15

  PERIOD = "1"

  LESSONS = [
    ["Ruby Fundamentals", 
      [
        [1, "Introduction to Ruby"],
        [2, "Setting up your environment"],
        [3, "Super Basic Command Line Crash Course"],
        [4, "Your First Ruby Program"],
        [5, "Math is easy"],
        [6, "Objects and Methods"],
        [7, "Variables"],
        [8, "Arrays"],
        [9, "Hashes"],
        [10, "Looping and Iterating"],
        [11, "Defining our own methods"],
        [12, "Conditionals and Logical Operators"]
      ]
    ],
    ["Object Oriented Programming",
      [
        [13, "Introduction to Object Oriented Programming"],
        [14, "Classes"],
        [15, "Instance Variables"],
        [16, "attr_reader and attr_writer"],
        [17, "Instance Methods, Class Methods, and Encapsulation"],
        [18, "Challenge: Building a Deck of Cards"]
      ]
    ],
    ["Ruby Challenges",
      [ 
        [19, "Foobar Challenge"],
        [20, "Test-First Ruby: Hello"],
        [21, "Challenge: Temperature Conversion"] 
      ]
    ]
  ]

end
