class AdminDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    admitted = User.admitted
    active_prework_students = User.active_prework_students
    signed_up_this_week = User.signed_up_this_week
    signed_up_last_week = User.signed_up_last_week
    signed_up_this_month = User.signed_up_this_month
    signed_up_last_month = User.signed_up_last_month

    @stat_hash = {
      admitted => "Admitted Students",
      active_prework_students => "Active Prework Students",
      signed_up_this_week => "signed up this week",
      signed_up_last_week => "signed up last week",
      signed_up_this_month => "signed up this month",
      signed_up_last_month => "signed up last month"
    }

    @mentor_sessions = MentorSession.all
      .order("created_at DESC")
      .paginate(page: params[:page], per_page: 5)    
      .includes(:student_session, :mentor, :user)

  end

end
