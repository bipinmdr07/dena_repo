class Admin::DecksController < ApplicationController
  before_action :authenticate_admin!

  def index
    @decks = Deck.master
  end

	def show
		@deck = Deck.includes(:cards).find(params[:id])
	end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    if @deck.save
      redirect_to admin_decks_path
    else
      flash[:alert] = "Invalid attributes. Please try again."
      render :new
    end 
  end

  private

  def deck_params
    params.require(:deck).permit(:title).merge(master: true)
  end

  def authenticate_admin!
    unless current_user.admin
      flash[:alert] = "Woops! You're unauthorized!"
      redirect_to dashboard_path
    end
  end

end
