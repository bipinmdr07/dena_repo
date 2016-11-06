class IntroLesson < Lesson
	COURSE_TITLE = "Introduction to TECHRISE"

	DURATION = 1

	PERIOD = "PREWORK"

	CHAPTERS = [
		Chapter.new("Getting Started with Web Development")
	]

	LESSONS = [		
		Lesson.new(1, "Goals of the Intro Course", CHAPTERS[0]),
		Lesson.new(2, "Why use the TECHRISE Flashcard System?", CHAPTERS[0]),
		Lesson.new(3, "How to Embed Code with TECHRISE Flashcards", CHAPTERS[0]),
		Lesson.new(4, "Getting Started", CHAPTERS[0])
	]


end
