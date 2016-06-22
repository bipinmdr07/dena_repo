class CardsController < ApplicationController
  before_action :authenticate_user!

  respond_to :js, :html, :json

  def index
    @cards = current_user.cards.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def create
    @card = current_user.cards.create(card_params)
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def update

  end

  def update_interval
    @card = Card.find(params[:id])
    @card.update_interval!(card_params[:quality_response].to_i)
    @card.create_activity key: 'flashcard.complete', owner: current_user, parameters: {card_id: @card.id}
    respond_to do |format|
      format.html { redirect_to study_path }
      format.js {}
    end
  end

  private

  def card_params
    params.require(:card).permit(:id, :user_id, :question, :answer, :topic, :prev_ef, :prev_interval, 
                        :quality_response, :calculated_interval, :calculated_ef, :repetition_date)
  end
  
end
