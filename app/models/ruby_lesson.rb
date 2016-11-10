class RubyLesson < Lesson
  COURSE_TITLE = "Ruby Fundamentals"

  DURATION = 15

  PERIOD = "1"

  chapter_1 = Chapter.new("Ruby Fundamentals")
  chapter_2 = Chapter.new("Object Oriented Programming")
  chapter_3 = Chapter.new("Ruby Challenges")

  CHAPTERS = [
    chapter_1,
    chapter_2,
    chapter_3
  ]

  LESSONS = [
    Lesson.new(1, "Introduction to Ruby", chapter_1),
    Lesson.new(2, "Setting up your environment", chapter_1),
    Lesson.new(3, "Super Basic Command Line Crash Course", chapter_1),
    Lesson.new(4, "Your First Ruby Program", chapter_1),
    Lesson.new(5, "Math is easy", chapter_1),
    Lesson.new(6, "Strings", chapter_1),
    Lesson.new(7, "Variables", chapter_1),
    Lesson.new(8, "Arrays", chapter_1),
    Lesson.new(9, "Hashes", chapter_1),
    Lesson.new(10, "Looping and Iterating", chapter_1),
    Lesson.new(11, "Defining our own methods", chapter_1),
    Lesson.new(12, "Conditionals and Logical Operators", chapter_1),
    Lesson.new(13, "Introduction to Object Oriented Programming", chapter_2),
    Lesson.new(14, "Classes", chapter_2),
    Lesson.new(15, "Instance Variables", chapter_2),
    Lesson.new(16, "attr_reader and attr_writer", chapter_2),
    Lesson.new(17, "Instance Methods, Class Methods, and Encapsulation", chapter_2),
    Lesson.new(18, "Inheritance", chapter_2),
    Lesson.new(19, "FizzBuzz Challenge", chapter_3),
    Lesson.new(20, "Test-First Ruby: Hello", chapter_3),
    Lesson.new(21, "Challenge: Temperature Conversion", chapter_3),
    Lesson.new(22, "Challenge: Ordinal", chapter_3),
    Lesson.new(23, "Challenge: Building a Deck of Cards", chapter_3)
  ]


end
