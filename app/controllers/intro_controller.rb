class IntroController < ApplicationController
	before_filter :authenticate_user!

	def show
		@lesson = params[:id].to_i
    @next_lesson = @lesson + 1 unless @lesson == 33
	end
	
end
