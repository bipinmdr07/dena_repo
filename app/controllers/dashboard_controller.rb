class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @due_cards = due_cards

    @activities = PublicActivity::Activity.where(owner_id: current_user.id)
    
    @lessons = PublicActivity::Activity.where(owner_id: current_user.id, key: 'progression.create')
    @flashcards = PublicActivity::Activity.where(owner_id: current_user.id, key: 'flashcard.complete')
    @last_lesson = PublicActivity::Activity.where(owner_id: current_user.id, key: 'progression.create').order('created_at DESC').first
    
    @community_questions = Question.recent.includes(:user)
    

    @questions = current_user.questions.student_post.order("created_at DESC").limit(5).includes(:user)
    @submissions = current_user.submissions.order("created_at DESC").limit(5).includes(:user)

    @last_mentor_session = current_user.mentor_sessions.last unless current_user.mentor

    @activities = PublicActivity::Activity.order('created_at DESC').limit(20).includes(:owner)
  
    @stats = DashboardStatsDecorator.new(lessons: @lessons, flashcards: @flashcards).build_stats

    @greeting_message = greeting_message

    if current_user.admin
      @unresolved_questions = Question.unresolved.includes(:user)
      @unapproved_submissions = Submission.unapproved.includes(:user)
    end
  end

  def greeting_message  
    @current_time = Time.now.to_i
    @midnight = Time.now.beginning_of_day.to_i
    @noon = Time.now.middle_of_day.to_i
    @five_pm = Time.now.change(:hour => 17 ).to_i
    @eight_pm = Time.now.change(:hour => 20 ).to_i 

    if @midnight.upto(@noon).include?(@current_time)
      @data = ["Morning","dashboard/sunrise.png"]
    elsif @noon.upto(@five_pm).include?(@current_time)
      @data = ["Afternoon","dashboard/afternoon.png"]
    elsif @five_pm.upto(@eight_pm).include?(@current_time)
      @data = ["Evening","dashboard/evening.png"]
    elsif @eight_pm.upto(@midnight + 1.day).include?(@current_time)
      @data = ["Night","dashboard/night.png"]
    end
  end

  private

  def due_cards
    return unless user_signed_in?
    current_user.cards.due
  end
end
