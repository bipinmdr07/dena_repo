class DashboardStatsDecorator
	Stat = Struct.new(:count, :text)

	def initialize(args)
		lessons = args[:lessons]
		flashcards = args[:flashcards]

		@lessons_completed_today = lessons.where("created_at >= ?", Time.zone.now.beginning_of_day).try(:count)
    @flashcards_completed_today = flashcards.where("created_at >= ?", Time.zone.now.beginning_of_day).try(:count)
    @lessons_completed_this_week = lessons.where("created_at >= ?", 1.week.ago).try(:count)
    @flashcards_completed_this_week = flashcards.where("created_at >= ?", 1.week.ago).try(:count)
	end

	def build_stats
		stats = []
		stats << Stat.new(@lessons_completed_today, "#{'Lesson'.pluralize(@lessons_completed_today)}  Completed Today")
		stats << Stat.new(@flashcards_completed_today, "#{'Flashcard'.pluralize(@flashcards_completed_today)}  Completed Today")
		stats << Stat.new(@lessons_completed_this_week, "#{'Lesson'.pluralize(@lessons_completed_this_week)}  Completed This Week")
		stats << Stat.new(@flashcards_completed_this_week, "#{'Flashcard'.pluralize(@flashcards_completed_this_week)}  Completed Today")
	end
end