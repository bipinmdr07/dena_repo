class CollaborationLesson < Lesson
  COURSE_TITLE = "Collaborating in a Software Engineering Team"  

  DURATION = 1

  PERIOD = "8 ~ 10"

  LESSONS = [
    ["Working together as a team",
      [
        [1, "Being a team player"],
        [2, "Communicating Effectively"]
      ]
    ],
    ["Agile and Scrum", 
      [
        [3, "Agile"],
        [4, "Scrum"]
      ]
    ],
    ["Tools to Collaborate Effectively", 
      [
        [5, "Trello"],
        [6, "Slack"],
        [7, "Github"],
        [8, "Continuous Integration"],
        [9, "Pair Programming"]
      ]
    ],
    ["Communication Guidelines",
      [ 
        [10, "How to communicate effectively online"],
        [11, "Making Awesome Pull Requests"],
        [12, "Code Reviews"]
      ]
    ]
  ]
end
