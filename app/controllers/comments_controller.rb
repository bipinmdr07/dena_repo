class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def new
		@comment = Comment.new
	end

	def create
		@comment = current_forum.comments.create(comment_params)
		redirect_to forum_comment_path(@comment.forum_id, @comment)
	end

	def show
		@comment = Comment.find(params[:id])
	end

	private

	def comment_params
		params.require(:comment).permit(:title, :description)
	end

	def current_forum
		Forum.find(params[:forum_id])
	end
end
