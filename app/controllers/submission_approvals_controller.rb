class SubmissionApprovalsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  respond_to :js, :html, :json

  def create
    @submission_comment = SubmissionComment.find(params[:id])
    if @submission_comment.approved
      @submission_comment.update(approved: false)
    else
      @submission_comment.update(approved: true)
    end

    respond_to do |format|
      format.html {}
      format.js {}
    end

  end

  private

  def check_if_admin
    return if current_user.admin
    flash[:alert] = "Unauthorized."
    redirect_to root_path
  end
end
