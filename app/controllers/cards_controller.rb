class CardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cards = current_user.cards.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def create
    @card = current_user.cards.create(card_params)

    flash[:success] = "New card added!"
    redirect_to new_card_path
  end

  def update

  end

  def update_interval
    @card = Card.find(params[:id])
    @card.update_interval!(card_params[:quality_response].to_i)
    redirect_to cards_path
  end

  private

  def card_params
    params.require(:card).permit(:id, :user_id, :question, :answer, :topic, :prev_ef, :prev_interval, 
                        :quality_response, :calculated_interval, :calculated_ef, :repetition_date)
  end
  
end
