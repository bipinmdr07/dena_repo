class HtmlCssLesson < Lesson
	COURSE_TITLE = "HTML/CSS"

	DURATION = 15

	PERIOD = "PREWORK"

	chapter_1 = Chapter.new("Building Your first HTML/CSS Projects")
	chapter_2 = Chapter.new("Build a Personal Resume Page")
	chapter_3 = Chapter.new("Next Steps")

	CHAPTERS = [
		chapter_1,
		chapter_2,
		chapter_3
	]

	LESSONS = [
		Lesson.new(1, "Guidelines for Learning", chapter_1),
		Lesson.new(2, "Building Your First Two HTML/CSS Projects", chapter_1),
		Lesson.new(3, "Introduction to HTML/CSS", chapter_2),
		Lesson.new(4, "Setting Up Your Environment", chapter_2),				
		Lesson.new(5, "Getting Started", chapter_2),
		Lesson.new(6, "Learning about Divs", chapter_2),
		Lesson.new(7, "Adding some Padding", chapter_2),
		Lesson.new(8, "Adding a Background Image", chapter_2),
		Lesson.new(9, "Creating a perfect background image", chapter_2),
		Lesson.new(10, "Adding Margins", chapter_2),
		Lesson.new(11, "Adding a Profile Picture", chapter_2),
		Lesson.new(12, "Making everything look nice", chapter_2),
		Lesson.new(13, "Adding Social Buttons", chapter_2),
		Lesson.new(14, "Final Touches", chapter_2),
		Lesson.new(15, "Congratulations", chapter_3)
	]
end
