class ForumsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@forum = Forum.create(forum_params)
		redirect_to new_forum_comment_path(@forum)
	end

	private

	def forum_params
		params.require(:forum).permit(:chapter, :lesson)
	end
end
