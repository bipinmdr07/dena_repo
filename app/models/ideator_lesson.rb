class IdeatorLesson < ActiveRecord::Base
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
		["Developing your Front End",
			[
				[5, "Installing Bootstrap"],
				[6, "Self Directed Lesson - Adding a Navbar"],
				[7, "Styling the Navbar"],
				[8, "Adding a Footer"],
				[9, "Creating a Model"]
			]
		],
		["Playing with the Database",
			[
				[10, "Adding an Idea"],
				[11, "Styling our Index Page"]
			]
		]
	]
end
