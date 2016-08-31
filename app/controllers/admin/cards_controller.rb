class Admin::CardsController < ApplicationController
  before_action :authenticate_admin!

  def new

  end 

  def create
		@card = Card.new(card_params)
		if @card.save

      @card.tag_list.add(card_params[:tag_list])
			flash[:success] = "New master card created!"
		else
			flash[:alert] = "Invalid attributes. Try again."
		end

		redirect_to admin_deck_path(params[:deck_id])
  end

  private

	def card_params
		params.require(:card).permit(:question, :answer, :tag_list).merge(deck_id: params[:deck_id], master: true)
	end

  def authenticate_admin!
    unless current_user.admin
      flash[:alert] = "Woops! You're unauthorized!"
      redirect_to dashboard_path
    end
  end
end
