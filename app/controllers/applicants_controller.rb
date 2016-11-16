class ApplicantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @applicants = User.unadmitted.order("created_at DESC")
                                 .paginate(page: params[:page], per_page: 50)
  end
end
