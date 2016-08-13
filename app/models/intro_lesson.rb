class IntroLesson < ActiveRecord::Base
	COURSE_TITLE = "Introduction to TECHRISE"

	LESSON_LENGTH = 4

	DURATION = 1

	PERIOD = "PREWORK"

	LESSONS = [
		["Introduction to TECHRISE", 
			[
				[1, "Welcome to TECHRISE"],
				[2, "Why use the TECHRISE Flashcard System?"],
				[3, "How to Embed Code with TECHRISE Flashcards"],
				[4, "Getting Started"]
			]
		]
	]


end
