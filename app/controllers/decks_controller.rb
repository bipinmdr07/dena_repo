class DecksController < ApplicationController
  before_action :authenticate_user!

  def index
    @decks = Deck.master
    render layout: "layouts/study"
  end

  def show
    @deck = Deck.find(params[:id])
  end
end
