class DecksController < ApplicationController
  before_action :authenticate_user!

  def index
    @decks = Deck.master.includes(:cards)
    render layout: "layouts/study"
  end

  def show
    @deck = Deck.includes(:cards).find(params[:id])
  end
end
