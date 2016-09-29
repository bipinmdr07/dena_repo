class TwitrLesson < Lesson
	COURSE_TITLE = "Ideator - an Idea Sharing App"

	DURATION = 25

	PERIOD = "2 ~ 3"

	CHAPTERS = [
		Chapter.new("Setting Up Your App"),
		Chapter.new("First Steps"),
		Chapter.new("Making the Site Look Good"),
		Chapter.new("Dynamically Adding Ideas"),
		Chapter.new("Updating and Deleting Ideas"),
		Chapter.new("Adding Other Pages"),
		Chapter.new("Final Touches")
	]

	LESSONS = [

		Lesson.new(1, "Setting up your Web Dev Environment", CHAPTERS[0]),
		Lesson.new(2, "Setting Up Git", CHAPTERS[0]),

		Lesson.new(3, "Creating Wireframes", CHAPTERS[1]),
		Lesson.new(4, "Creating your First Page", CHAPTERS[1]),

		Lesson.new(5, "Installing Bootstrap", CHAPTERS[2]),
		Lesson.new(6, "Self Directed Lesson - Adding a Navbar", CHAPTERS[2]),
		Lesson.new(7, "Styling the Navbar", CHAPTERS[2]),
		Lesson.new(8, "Adding a Footer", CHAPTERS[2]),

		Lesson.new(9, "Creating a Model", CHAPTERS[3]),
		Lesson.new(10, "Adding an Idea", CHAPTERS[3]),
		Lesson.new(11, "Styling our Index Page", CHAPTERS[3]),
		Lesson.new(12, "Creating a Form", CHAPTERS[3]),
		Lesson.new(13, "Moving the Form into a Modal", CHAPTERS[3]),

		Lesson.new(14, "Editing and Updating Ideas", CHAPTERS[4]),
		Lesson.new(15, "Validate User Input - Validations", CHAPTERS[4]),
		Lesson.new(16, "Deleting Ideas and Adding Links", CHAPTERS[4]),	
		
		Lesson.new(17, "Setting Up the Static Pages Controller", CHAPTERS[5]),
		Lesson.new(18, "Adding the About Page", CHAPTERS[5]),
		Lesson.new(19, "Configuring the Random Page", CHAPTERS[5]),
		
		Lesson.new(20, "Adding Pagination", CHAPTERS[6]),
		Lesson.new(21, "Last Few Tweaks", CHAPTERS[6]),
		Lesson.new(22, "Congratulations!", CHAPTERS[6])
	]
end
