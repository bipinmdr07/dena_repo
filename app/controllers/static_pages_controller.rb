include ActionView::Helpers::TextHelper

class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: :guidelines

  layout :landing_page, except: [:index, :guidelines, :preregistration]
  
  def index
  	if current_user.present?
			redirect_to dashboard_path
		else
    	render layout: "landing_page"
    end
  end

  def preregistration
    render layout: 'preregistration'
  end

  def remote
    render layout: 'details'
  end

  def immersive
    render layout: 'details'
  end


  private

  def landing_page
    "landing_page"
  end

end
