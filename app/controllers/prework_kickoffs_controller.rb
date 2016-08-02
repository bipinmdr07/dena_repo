class PreworkKickoffsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.update(prework_start_time: Date.today, prework_end_date: Date.today + 2.weeks)
    flash[:success] = "Pre-work has begun! You have until " + current_user.prework_end_date.strftime("%m/%d/%Y %l:%M %p") + " to finish the pre-work."
    redirect_to dashboard_path
  end
end
