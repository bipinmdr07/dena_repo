class MenteesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_mentor!

  def index
    @mentees = current_user.mentees.order("graduation_date DESC")
  end

  private

  def authenticate_mentor!
    redirect_to root_path unless current_user.mentor
  end
end
