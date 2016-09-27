class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @due_cards = due_cards
    
    @lessons = PublicActivity::Activity.where(owner_id: current_user.id, key: 'progression.create')
    @flashcards = PublicActivity::Activity.where(owner_id: current_user.id, key: 'flashcard.complete')
    @last_lesson = PublicActivity::Activity.where(owner_id: current_user.id, key: 'progression.create').order('created_at DESC').first
    @quote = Quote::ARRAY.sample

    @questions = current_user.questions.where(mentor_post: false).order("created_at DESC").limit(5).includes(:user)
    @submissions = current_user.submissions.order("created_at DESC").limit(5).includes(:user)

    @last_mentor_session = current_user.mentor_sessions.last unless current_user.mentor

    @activities = PublicActivity::Activity.order('created_at DESC').limit(20).includes(:owner)

    @lessons_completed_today = @lessons.where("created_at >= ?", Time.zone.now.beginning_of_day)
    @flashcards_completed_today = @flashcards.where("created_at >= ?", Time.zone.now.beginning_of_day)
    @lessons_completed_this_week = @lessons.where("created_at >= ?", 1.week.ago)
    @flashcards_completed_this_week = @flashcards.where("created_at >= ?", 1.week.ago)

    @stat_hash = {
      @lessons_completed_today => "Lesson".pluralize(@completed_lessons_today.try(:count)) + " Completed Today",
      @flashcards_completed_today => "Flashcard".pluralize(@flashcards_completed_today.try(:count)) + " Completed Today",
      @lessons_completed_this_week => "Lesson".pluralize(@lessons_completed_this_week.try(:count)) + " Completed This Week",
      @flashcards_completed_this_week => "Flashcard".pluralize(@flashcards_completed_this_week.try(:count)) + " Completed Today"
    }

    if current_user.admin
      @unresolved_questions = Question.unresolved.includes(:user)
      @unapproved_submissions = Submission.unapproved.includes(:user)
    end
  end

  private

  def due_cards
    return unless user_signed_in?
    current_user.cards.due
  end
end