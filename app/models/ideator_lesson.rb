class IdeatorLesson < ActiveRecord::Base
	COURSE_TITLE = "Ideator - an Idea Sharing App"

	LESSON_LENGTH = 22

	DURATION = 25

	PERIOD = "2 ~ 3"

	LESSONS = [
		["Setting Up Your App", 
			[
				[1, "Setting up your Web Dev Environment"],
				[2, "Setting Up Git"]
			]
		],
		["First Steps", 
			[
				[3, "Creating Wireframes"],
				[4, "Creating your First Page"]
			]
		],
		["Making the Site Look Good",
			[
				[5, "Installing Bootstrap"],
				[6, "Self Directed Lesson - Adding a Navbar"],
				[7, "Styling the Navbar"],
				[8, "Adding a Footer"]
			]
		],
		["Dynamically Adding Ideas",
			[
				[9, "Creating a Model"],
				[10, "Adding an Idea"],
				[11, "Styling our Index Page"],
				[12, "Creating a Form"],
				[13, "Moving the Form into a Modal"]
			]
		],
		["Updating and Deleting Ideas",
			[
				[14, "Editing and Updating Ideas"],
				[15, "Validate User Input - Validations"],
				[16, "Deleting Ideas and Adding Links"]
			]
		],
		["Adding Other Pages",
			[
				[17, "Setting Up the Static Pages Controller"],
				[18, "Adding the About Page"],
				[19, "Configuring the Random Page"]
			]
		],
		["Final Touches",
			[
				[20, "Adding Pagination"],
				[21, "Last Few Tweaks"],
				[22, "Congratulations!"]
			]
		]
	]
end
