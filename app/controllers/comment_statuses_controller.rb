class CommentStatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin_or_questioner

  respond_to :js, :html, :json

  def create
    @comment = Comment.find(params[:id])
    if @comment.resolved
      @comment.update(resolved: false)
    else
      @comment.update(resolved: true)
    end

    respond_to do |format|
      format.html {}
      format.js {}
    end

  end

  private

  def check_if_admin_or_questioner
    return if current_user.admin || @comment.user_id == current_user
    flash[:alert] = "Unauthorized."
    redirect_to root_path
  end
end
