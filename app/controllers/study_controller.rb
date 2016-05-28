class StudyController < ApplicationController
  def index
    @cards = current_user.cards.where(repetition_date: Date.today).order("repetition_date DESC")
  end
end
