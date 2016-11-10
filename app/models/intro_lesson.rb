class IntroLesson < Lesson
	COURSE_TITLE = "Introduction to TECHRISE"

	DURATION = 1

	PERIOD = "PREWORK"

	CHAPTERS = [
		Chapter.new("Getting Started with Web Development")
	]

	LESSONS = [		
		Lesson.new(1, "Goals of the Intro Course", CHAPTERS[0])
	]


end
