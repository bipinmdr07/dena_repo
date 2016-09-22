class StudentAdmissionsController < ApplicationController
  before_action :authenticate_admin!

  def create    
    user = User.find(params[:user_id])

    if user.admitted
      flash[:alert] = "User has already been admitted"
    else
      user.set_admitted!

      flash[:success] = "#{user.name} has been admitted!"      
    end

    redirect_to admin_dashboard_index_path

  end
end
