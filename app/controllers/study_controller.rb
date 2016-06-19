class StudyController < ApplicationController
  def index
    @cards = current_user.cards.where(repetition_date: nil)
    @cards += current_user.cards.today
    render layout: "layouts/study"
  end
end
