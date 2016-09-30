class TwitrLesson < Lesson
	COURSE_TITLE = "Twitr - Share your Thoughts"

	DURATION = 25

	PERIOD = "2 ~ 3"

	CHAPTERS = [
		Chapter.new("Setting Up Your App"),
		Chapter.new("First Steps"),
		Chapter.new("Adding User Authentication"),
		Chapter.new("Making the Site Look Good"),
		Chapter.new("Dynamically Adding Ideas"),
		Chapter.new("Updating and Deleting Ideas"),
		Chapter.new("Adding Other Pages"),
		Chapter.new("Final Touches")
	]

	LESSONS = [

		Lesson.new(1, "Setting up your Web Dev Environment", CHAPTERS[0]),
		Lesson.new(2, "Setting Up Git and Heroku", CHAPTERS[0]),

		Lesson.new(3, "Web Application Crash Course", CHAPTERS[1]),
		Lesson.new(4, "Creating your First Page", CHAPTERS[1]),

		Lesson.new(5, "Installing Bootstrap", CHAPTERS[2]),
		Lesson.new(6, "Self Directed Lesson - Adding a Navbar", CHAPTERS[2]),
		Lesson.new(7, "Styling the Navbar", CHAPTERS[2]),
		Lesson.new(8, "Adding a Footer", CHAPTERS[2]),

		Lesson.new(9, "Installing Devise", CHAPTERS[3]),
		Lesson.new(10, "Adding Log in/Log Out/Sign Up Links", CHAPTERS[3]),
		Lesson.new(11, "Setting Up User Forms", CHAPTERS[3]),
		Lesson.new(12, "Making the forms look nice", CHAPTERS[3]),

		Lesson.new(13, "Creating a Model", CHAPTERS[4]),
		Lesson.new(14, "Adding an Idea", CHAPTERS[4]),
		Lesson.new(15, "Styling our Index Page", CHAPTERS[4]),
		Lesson.new(16, "Creating a Form", CHAPTERS[4]),
		Lesson.new(17, "Moving the Form into a Modal", CHAPTERS[4]),

		Lesson.new(18, "Editing and Updating Ideas", CHAPTERS[5]),
		Lesson.new(19, "Validate User Input - Validations", CHAPTERS[5]),
		Lesson.new(20, "Deleting Ideas and Adding Links", CHAPTERS[5]),	
		
		Lesson.new(21, "Setting Up the Static Pages Controller", CHAPTERS[6]),
		Lesson.new(22, "Adding the About Page", CHAPTERS[6]),
		Lesson.new(23, "Configuring the Random Page", CHAPTERS[6]),
		
		Lesson.new(24, "Adding Pagination", CHAPTERS[7]),
		Lesson.new(25, "Last Few Tweaks", CHAPTERS[7]),
		Lesson.new(26, "Congratulations!", CHAPTERS[7])
	]
end
