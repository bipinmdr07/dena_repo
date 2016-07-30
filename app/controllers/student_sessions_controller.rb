class StudentSessionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @mentor_sessions = current_user.mentor_sessions.order("created_at DESC")
    @mentor = User.find(current_user.mentor_id) if current_user.mentor_id
  end

  def new
    @student_session = StudentSession.new
  end

  def create
    @student_session = StudentSession.create(student_session_params)
    if @student_session.valid?
      flash[:success] = "Mentor session logged!"
      redirect_to student_sessions_path
    else
      flash[:alert] = "Invalid attributes. Please try again."
      render :new
    end
  end

  private

  def student_session_params
    params.require(:student_session).permit(:user_id, :private_details, :public_details, :motivation_level, :mentor_session_id).merge(user_id: current_user.id, mentor_id: current_user.mentor_id)
  end 
end
