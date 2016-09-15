class StudyController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @due_cards = due_cards
    render layout: "layouts/study"
  end

  private

  def due_cards
    current_user.cards.due
  end
end
