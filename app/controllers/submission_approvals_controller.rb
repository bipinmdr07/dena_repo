class SubmissionApprovalsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  respond_to :js, :html, :json

  def create
    @submission = Submission.find(params[:id])
    if @submission.approved
      @submission.update(approved: false)
    else
      @submission.update(approved: true)
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
