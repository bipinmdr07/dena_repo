class IdeatorLessonsController < ApplicationController
	before_action :authenticate_user!

	def index
		@lessons = IdeatorLesson::LESSONS
	end

	def show
		@lesson = params[:id]
    @next_lesson = @lesson.to_i + 1 unless @lesson == 14
    @lesson == 1 ? @prev_lesson = 0 : @prev_lesson = @lesson.to_i - 1
	end

end