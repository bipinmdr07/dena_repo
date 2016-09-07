include ActionView::Helpers::TextHelper

class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: :guidelines
  
  def index
  	if current_user.present?
			redirect_to dashboard_path
		else
    	render layout: "landing_page"
    end
  end

  def guidelines
  end

  def curriculum
    render layout: "landing_page"
  end

  def about
    render layout: "landing_page"
  end

  def pricing
    render layout: "landing_page"
  end

  def contact_us
    render layout: "landing_page"
  end

  def congratulations
    render layout: "landing_page"
  end

  def learn
    render layout: "landing_page"
  end

  def preregistration
    render layout: 'preregistration'
  end

  def support
    render layout: "landing_page"
  end

end
