class IntroLesson < ActiveRecord::Base
	COURSE_TITLE = "Intro to Web Development"

	LESSON_LENGTH = 5

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
				[5, "Guidelines to maximize your learning experience"]
			]
		]
	]
end
