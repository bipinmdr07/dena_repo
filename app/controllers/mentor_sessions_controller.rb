class MentorSessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_mentor!

  def index
    @mentor_sessions = MentorSession.where(user_id: params[:mentee_id]).order("created_at DESC")
    @mentee = User.find(params[:mentee_id])
  end

  def show
    @mentor_session = MentorSession.find(params[:id])
  end

  def new
    @mentor_session = MentorSession.new
  end

  def create
    @mentor_session = MentorSession.create(mentor_session_params)
    if @mentor_session.valid?
      flash[:success] = "Mentor session logged!"
      redirect_to mentee_mentor_sessions_path(mentor_session_params[:user_id])
    else
      flash[:alert] = "Invalid attributes. Please try again."
      render :new
    end
  end

  def edit
    @mentor_session = MentorSession.find(params[:id])
  end

  def update
    @mentor_session = MentorSession.find(params[:id])
    if @mentor_session.update
      flash[:success] = "Updated mentor log"
    else
      flash[:alert] = "Invalid attributes. Please try again."
      render :edit
    end
  end

  private

  def mentor_session_params
    params.require(:mentor_session).permit(:mentor_id, :user_id, :private_details, :public_details, :homework_assigned, :session_date).merge(mentor_id: current_user.id)
  end 

  def authenticate_mentor!
    return if current_user.mentor
    flash[:alert] = "Unauthorized"
    redirect_to root_path 
  end
end
