class PreworkKickoffsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_already_started?

  def create
    current_user.start_prework!
    flash[:success] = "Pre-work has begun! You have until " + current_user.prework_end_date.strftime("%m/%d/%Y %l:%M %p") + " to finish the pre-work."
    redirect_to dashboard_path
  end

  private

  def check_already_started?
    return unless current_user.has_started_prework?
    flash[:alert] = "You cannot start prework again."
    redirect_to dashboard_path
  end
end
