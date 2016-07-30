class MenteesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_mentor!

  def index
    @mentees = User.where(mentor_id: current_user.id).order("graduation_date DESC")
  end

  private

  def authenticate_mentor!
    redirect_to root_path unless current_user.mentor
  end
end
