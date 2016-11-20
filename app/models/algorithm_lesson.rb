class AlgorithmLesson < Lesson

  COURSE_TITLE = "Understanding Data Structures and Algorithms"

  DURATION = 30

  PERIOD = "8 ~ 10"

  CHAPTERS = [
    Chapter.new("Introduction to Data Structures and Algorithms"),
    Chapter.new("Big-O Time Complexity"),
    Chapter.new("Arrays"),
    Chapter.new("Stacks and Queues"),
    Chapter.new("Arrays and Linked Lists"),    
    Chapter.new("Trees"),
    Chapter.new("Sorting Algorithms")
  ]

  LESSONS = [
    Lesson.new(1, "Introduction", CHAPTERS[0]),
    Lesson.new(2, "Big-O Notation", CHAPTERS[1]),
    Lesson.new(3, "Analyzing the Time Complexity", CHAPTERS[1]),
    Lesson.new(4, "Walking through a Problem", CHAPTERS[1]),
    Lesson.new(5, "Rotating a Matrix", CHAPTERS[2]),
    Lesson.new(6, "Create a Stack", CHAPTERS[3]),
    Lesson.new(7, "Create a Queue", CHAPTERS[3]),
    Lesson.new(8, "Reversing a Linked List and Cycle Detection", CHAPTERS[4]),
    Lesson.new(9, "Traversing a Binary Tree", CHAPTERS[5]),
    Lesson.new(12, "Sorting a Binary Tree", CHAPTERS[5]),
    Lesson.new(13, "Bubble Sort", CHAPTERS[6]),
    Lesson.new(14, "Selection Sort", CHAPTERS[6]),
    Lesson.new(15, "Insertion Sort", CHAPTERS[6]),
    Lesson.new(16, "Quick Sort", CHAPTERS[6]),
    Lesson.new(17, "Merge Sort", CHAPTERS[6])
  ]
end
