class AdminDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    admitted = User.admitted
    active_prework_students = User.active_prework_students
    signed_up_this_week = User.signed_up_this_week
    signed_up_last_week = User.signed_up_last_week
    signed_up_this_month = User.signed_up_this_month

    @stat_hash = {
      admitted => "Admitted Students",
      active_prework_students => "Active Prework Students",
      signed_up_this_week => "signed up this week",
      signed_up_last_week => "signed up last week",
      signed_up_this_month => "signed up this month"
    }

    @mentor_sessions = MentorSession.includes(:student_session).all.paginate(page: params[:page], per_page: 5)

  end

  private

  def authenticate_admin!
    return if current_user && current_user.admin
    flash[:alert] = "Unauthorized :("
    redirect_to dashboard_path
  end
end
