class AlgorithmLesson < Lesson

  COURSE_TITLE = "Understanding Data Structures and Algorithms"

  DURATION = 30

  PERIOD = "8 ~ 10"

  CHAPTERS = [
    Chapter.new("Introduction to Data Structures and Algorithms"),
    Chapter.new("Arrays and Linked Lists"),
    Chapter.new("Stacks and Queues"),
    Chapter.new("Hashes"),
    Chapter.new("Trees"),
    Chapter.new("Sorting Algorithms")
  ]

  LESSONS = [
    Lesson.new(1, "Introduction", CHAPTERS[0]),
    Lesson.new(2, "Big-O Notation", CHAPTERS[0]),
    Lesson.new(3, "Walking through a Problem", CHAPTERS[0]),
    Lesson.new(4, "Rotating a Matrix", CHAPTERS[0]),
    Lesson.new(4, "Create a Stack", CHAPTERS[0]),
    Lesson.new(5, "Create a Queue", CHAPTERS[0]),
    Lesson.new(4, "Reverse a Linked List", CHAPTERS[0]),
    Lesson.new(5, "Detect a Cycle", CHAPTERS[0]),
    Lesson.new(5, "Traversing a Binary Tree", CHAPTERS[0]),
    Lesson.new(5, "Binary Search Tree", CHAPTERS[0]),
    Lesson.new(5, "Sorting a Binary Tree", CHAPTERS[0]),
    Lesson.new(21, "Bubble Sort", CHAPTERS[5]),
    Lesson.new(22, "Selection Sort", CHAPTERS[5]),
    Lesson.new(23, "Insertion Sort", CHAPTERS[5]),
    Lesson.new(24, "Quick Sort", CHAPTERS[5]),
    Lesson.new(25, "Merge Sort", CHAPTERS[5])
  ]
end
