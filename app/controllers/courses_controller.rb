class CoursesController < ApplicationController
  before_action :authenticate_user!
  def index
    @due_cards = due_cards

    @activities = PublicActivity::Activity.where(owner_id: current_user.id)
    @lessons = PublicActivity::Activity.where(owner_id: current_user.id, key: 'progression.create')
    @flashcards = PublicActivity::Activity.where(owner_id: current_user.id, key: 'flashcard.complete')
    @last_lesson = PublicActivity::Activity.where(owner_id: current_user.id, key: 'progression.create').order('created_at DESC').first
  end

  private

  def due_cards
    return unless user_signed_in?
    current_user.cards.due
  end
end