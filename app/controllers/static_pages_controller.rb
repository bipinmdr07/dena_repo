class StaticPagesController < ApplicationController
	before_filter :authenticate_user!, only: [:courses]

  def index
  	if current_user.present?
			redirect_to courses_path
		else
    	render layout: "landing_page"
    end
  end

  def courses
    @cards = current_user.cards.where(repetition_date: nil)
    @cards += current_user.cards.today
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
