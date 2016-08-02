class MentorMaterialsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_mentor!

  private

  def authenticate_mentor!
    return if current_user.mentor
    flash[:alert] = "Unauthorized"
    redirect_to root_path
  end
end
