class DecksController < ApplicationController
  def index
    @decks = Deck.master
  end

  def show
    @deck = Deck.find(params[:id])
  end
end
