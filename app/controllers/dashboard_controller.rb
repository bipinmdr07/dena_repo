class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @due_cards = due_cards

    @activities = PublicActivity::Activity.where(owner_id: current_user.id)
    
    @lessons = PublicActivity::Activity.where(owner_id: current_user.id, key: 'progression.create')
    @flashcards = PublicActivity::Activity.where(owner_id: current_user.id, key: 'flashcard.complete')
    @last_lesson = PublicActivity::Activity.where(owner_id: current_user.id, key: 'progression.create').order('created_at DESC').first
    @quote = Quote::ARRAY.sample

    @questions = current_user.questions.student_post.order("created_at DESC").limit(5).includes(:user)
    @submissions = current_user.submissions.order("created_at DESC").limit(5).includes(:user)

    @last_mentor_session = current_user.mentor_sessions.last unless current_user.mentor

    @activities = PublicActivity::Activity.order('created_at DESC').limit(20).includes(:owner)
  
    @stats = DashboardStatsDecorator.new(lessons: @lessons, flashcards: @flashcards).build_stats

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
