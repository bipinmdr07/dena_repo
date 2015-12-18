class StaticPagesController < ApplicationController
	before_filter :authenticate_user!, only: [:courses]
  def index
  	if current_user.present?
			redirect_to courses_path
		else
    	render layout: "landing_page"
    end
  end

end
