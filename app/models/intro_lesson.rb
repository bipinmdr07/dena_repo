class IntroLesson < ActiveRecord::Base
	COURSE_TITLE = "Intro to Web Development"

	LESSON_LENGTH = 7

	DURATION = 1

	PERIOD = "PREWORK"

	LESSONS = [
		["What is Web Development?", 
			[
				[1, "Congratulations!"],
				[2, "What do web developers do?"],
				[3, "What language should I learn?"],
				[4, "Overview of languages and tools"]
			]
		],
		["Maximize your learning",
			[
				[5, "Why use the TECHRISE Flashcard System?"],
				[6, "How to Embed Code with TECHRISE Flashcards"],
				[7, "Guidelines to maximize your learning experience"]
			]
		]
	]


end
