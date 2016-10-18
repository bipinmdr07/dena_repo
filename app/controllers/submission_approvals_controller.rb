class SubmissionApprovalsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  def create
    @submission = Submission.find(params[:id])
    
    if @submission.approved
      @submission.update(approved: false)
    else
      @submission.update(approved: true)
      send_notification!
    end

    respond_to do |format|
      format.html {}
      format.json { render json: 200 }
    end

  end

  private

  def send_notification!
    Notification.create(recipient: @submission.user, 
                          actor: current_user, 
                          action: "approved", 
                          notifiable: @submission)
  end

  def check_if_admin
    return if current_user.admin
    flash[:alert] = "Unauthorized."
    redirect_to root_path
  end
end
