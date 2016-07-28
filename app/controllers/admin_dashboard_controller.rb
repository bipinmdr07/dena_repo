class AdminDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  private

  def authenticate_admin!
    return if current_user && current_user.admin
    flash[:alert] = "Unauthorized :("
    redirect_to :back
  end
end
