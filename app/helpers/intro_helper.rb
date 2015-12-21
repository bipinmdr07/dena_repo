module IntroHelper
	def title_for(course, chapter, lesson)
		course::LESSONS[0][chapter][lesson - 1][1]
	end
end
