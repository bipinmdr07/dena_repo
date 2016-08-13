class HtmlCssLesson < ActiveRecord::Base
	COURSE_TITLE = "HTML/CSS"

	LESSON_LENGTH = 5

	DURATION = 15

	PERIOD = "PREWORK"

	LESSONS = [
		["Introduction to HTML/CSS", 
			[
				[1, "Guidelines for Learning"],
				[2, "Building Your First Two HTML/CSS Projects"]
			]
		],
		["Build a Personal Resume Page", 
			[
				[3, "Setting Up Your Environment"],
				[4, "Building a Simple Personal Resume Page in 25 minutes"]
			]
		],
		["Next Steps",
			[
				[5, "Congratulations"]
			]
		]
	]
end
