class CollaborationLesson < Lesson
  COURSE_TITLE = "Collaborating in a Software Engineering Team"  

  DURATION = 1

  PERIOD = "8 ~ 10"

  CHAPTERS = [
    Chapter.new("Working together as a team"),
    Chapter.new("Agile and Scrum"),
    Chapter.new("Tools to Collaborate Effectively"),
    Chapter.new("Communication Guidelines")
  ]

  LESSONS = [
    Lesson.new(1, "Being a team player", CHAPTERS[0]),
    Lesson.new(2, "Communicating Effectively", CHAPTERS[0]),

    Lesson.new(3, "Agile", CHAPTERS[1]),
    Lesson.new(4, "Scrum", CHAPTERS[1]),

    Lesson.new(5, "Trello", CHAPTERS[2]),
    Lesson.new(6, "Slack", CHAPTERS[2]),
    Lesson.new(7, "Github", CHAPTERS[2]),
    Lesson.new(8, "Continuous Integration", CHAPTERS[2]),
    Lesson.new(9, "Pair Programming", CHAPTERS[2]),

    Lesson.new(10, "How to communicate effectively online", CHAPTERS[3]),
    Lesson.new(11, "Making Awesome Pull Requests", CHAPTERS[3]),
    Lesson.new(12, "Code Reviews", CHAPTERS[3])
  ]
end
