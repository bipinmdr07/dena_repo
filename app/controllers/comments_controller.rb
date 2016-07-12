class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def new
		@comment = Comment.new
	end

	def create
		@comment = current_user.comments.create(comment_params)
		@forum = Forum.find(params[:forum_id])
		user = User.find(@comment.user_id)

		UserMailer.new_question(@forum, @comment).deliver

		Slack.chat_postMessage(text: 'New question: <' + forum_comment_url(@forum, @comment) + '|' + @comment.title + '> by ' + user.name, username: 'TECHRISE Bot', channel: "#forum_questions", icon_emoji: ":smile_cat:")
		redirect_to forum_comment_path(@comment.forum_id, @comment)
	end

	def show
		@comment = Comment.find(params[:id])
		@user = User.find(@comment.user_id)
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to :back
	end

	private

	def comment_params
		params.require(:comment).permit(:title, :description, :lesson, :forum_id)
	end

end
