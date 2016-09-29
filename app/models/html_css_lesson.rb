class HtmlCssLesson < Lesson
	COURSE_TITLE = "HTML/CSS"

	DURATION = 15

	PERIOD = "PREWORK"

	CHAPTERS = [
		Chapter.new("Building Your first HTML/CSS Projects"),
		Chapter.new("Build a Personal Resume Page"),
		Chapter.new("Next Steps")
	]

	LESSONS = [
		Lesson.new(1, "Guidelines for Learning", CHAPTERS[0]),
		Lesson.new(2, "Building Your First Two HTML/CSS Projects", CHAPTERS[0]),

		Lesson.new(3, "Introduction to HTML/CSS", CHAPTERS[1]),
		Lesson.new(4, "Setting Up Your Environment", CHAPTERS[1]),				
		Lesson.new(5, "Getting Started", CHAPTERS[1]),
		Lesson.new(6, "Learning about Divs", CHAPTERS[1]),
		Lesson.new(7, "Adding some Padding", CHAPTERS[1]),
		Lesson.new(8, "Adding a Background Image", CHAPTERS[1]),
		Lesson.new(9, "Creating a perfect background image", CHAPTERS[1]),
		Lesson.new(10, "Adding Margins", CHAPTERS[1]),
		Lesson.new(11, "Adding a Profile Picture", CHAPTERS[1]),
		Lesson.new(12, "Making everything look nice", CHAPTERS[1]),
		Lesson.new(13, "Adding Social Buttons", CHAPTERS[1]),
		Lesson.new(14, "Final Touches", CHAPTERS[1]),
		
		Lesson.new(15, "Congratulations", CHAPTERS[2])
	]
end
