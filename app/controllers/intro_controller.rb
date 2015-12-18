class IntroController < ApplicationController
	before_filter :authenticate_user!

	def index
		@lessons = Intro::LESSONS
	end

	def show
		@lesson = params[:id]
    # @next_lesson = @lesson + 1 unless @lesson == 33
	end
	
end
