class HtmlCssController < ApplicationController
	before_filter :authenticate_user!

	def index
		@lessons = HtmlCss::LESSONS
	end

	def show
		@lesson = params[:id]
    @next_lesson = @lesson.to_i + 1 unless @lesson == 33
    @lesson == 1 ? @prev_lesson = 0 : @prev_lesson = @lesson.to_i - 1
	end

end
