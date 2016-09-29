class IntroLesson < Lesson
	COURSE_TITLE = "Introduction to TECHRISE"

	DURATION = 1

	PERIOD = "PREWORK"

	CHAPTERS = [
		Chapter.new("Introduction to TECHRISE")
	]

	LESSONS = [		
		Lesson.new(1, "Welcome to TECHRISE", CHAPTERS[0]),
		Lesson.new(2, "Why use the TECHRISE Flashcard System?", CHAPTERS[0]),
		Lesson.new(3, "How to Embed Code with TECHRISE Flashcards", CHAPTERS[0]),
		Lesson.new(4, "Getting Started", CHAPTERS[0])
	]


end
