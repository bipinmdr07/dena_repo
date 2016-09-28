class IntroLesson < Lesson
	COURSE_TITLE = "Introduction to TECHRISE"

	DURATION = 1

	PERIOD = "PREWORK"

	chapter_1 = Chapter.new("Introduction to TECHRISE")

	CHAPTERS = [
		chapter_1
	]

	LESSONS = [		
		Lesson.new(1, "Welcome to TECHRISE", chapter_1),
		Lesson.new(2, "Why use the TECHRISE Flashcard System?", chapter_1),
		Lesson.new(3, "How to Embed Code with TECHRISE Flashcards", chapter_1),
		Lesson.new(4, "Getting Started", chapter_1)
	]


end
