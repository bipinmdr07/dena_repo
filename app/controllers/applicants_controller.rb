class ApplicantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!  

  def index
    @applicants = User.where(admitted: false).order("created_at DESC")
                                             .paginate(page: params[:page], per_page: 5)
  end
end
