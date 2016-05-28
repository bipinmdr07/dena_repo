class StudyController < ApplicationController
  def index
    @cards = current_user.cards.order("repetition_date DESC")
  end
end
