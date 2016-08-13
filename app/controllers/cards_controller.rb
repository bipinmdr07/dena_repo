class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_card_owner, only: [:show, :edit, :update, :destroy, :archive]

  respond_to :js, :html, :json
  layout :study_layout

  def index
    @cards = current_user.cards.all.order("created_at DESC")
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = current_user.cards.new(card_params)
    if @card.save!
      @card.tag_list.add(card_params[:tag_list])
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to cards_path
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
  end

  def archive
    @card = Card.find(params[:card_id])
    @card.archived ? @card.archived = false : @card.archived = true
    @card.save!
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

  def check_card_owner
    @card = params[:id] ? Card.find(params[:id]) : Card.find(params[:card_id])
    return if @card.user == current_user
    flash[:alert] = "Unauthorized!" 
    redirect_to cards_path
  end

  def study_layout
     "layouts/study"
  end

  def card_params
    params.require(:card).permit(:id, :user_id, :question, :answer, :topic, :prev_ef, :prev_interval, 
                        :quality_response, :calculated_interval, :calculated_ef, :repetition_date, :tag_list, :lesson_url)
  end
  
end
