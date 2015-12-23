module ApplicationHelper
	def title_for(course, chapter, lesson)
		course::LESSONS[chapter - 1][1][lesson - 1][1]
	end
end
