class StudentSessionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @mentor_sessions = current_user.mentor_sessions.order("created_at DESC")
    @mentor = User.find(current_user.mentor_id) if current_user.mentor_id
    @last_student_session = current_user.student_sessions.order("created_at DESC").first
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

  def edit
    @student_session = StudentSession.find(params[:id])
  end

  def update
    @student_session = StudentSession.find(params[:id])
    if @student_session.update(student_session_params)
      flash[:success] = "Updated mentor log"
      redirect_to student_sessions_path
    else
      flash[:alert] = "Invalid attributes. Please try again."
      render :edit
    end
  end


  private

  def student_session_params
    params.require(:student_session).permit(:user_id, :private_details, :public_details, :motivation_level, :mentor_session_id).merge(user_id: current_user.id, mentor_id: current_user.mentor_id)
  end
end
