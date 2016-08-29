class HtmlCssLesson < ActiveRecord::Base
	COURSE_TITLE = "HTML/CSS"

	LESSON_LENGTH = 15

	DURATION = 15

	PERIOD = "PREWORK"

	LESSONS = [
		["Building Your first HTML/CSS Projects", 
			[
				[1, "Guidelines for Learning"],
				[2, "Building Your First Two HTML/CSS Projects"]
			]
		],
		["Build a Personal Resume Page", 
			[
				[3, "Introduction to HTML/CSS"],
				[4, "Setting Up Your Environment"],				
				[5, "Getting Started"],
				[6, "Learning about Divs"],
				[7, "Adding some Padding"],
				[8, "Adding a Background Image"],
				[9, "Creating a perfect background image"],
				[10, "Adding Margins"],
				[11, "Adding a Profile Picture"],
				[12, "Making everything look nice"],
				[13, "Adding Social Buttons"],
				[14, "Final Touches"],
			]
		],
		["Next Steps",
			[
				[15, "Congratulations"]
			]
		]
	]
end
