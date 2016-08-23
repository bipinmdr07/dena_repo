include ActionView::Helpers::TextHelper

class StaticPagesController < ApplicationController
	before_filter :authenticate_user!, only: [:courses, :activity_log, :dashboard]

  def index
  	if current_user.present?
			redirect_to dashboard_path
		else
    	render layout: "landing_page"
    end
  end

  def dashboard
    @cards = current_user.cards.where(repetition_date: nil)
    @cards += current_user.cards.today
    @activities = PublicActivity::Activity.where(owner_id: current_user.id)
    @lessons = PublicActivity::Activity.where(owner_id: current_user.id, key: 'progression.create')
    @flashcards = PublicActivity::Activity.where(owner_id: current_user.id, key: 'flashcard.complete')
    @last_lesson = PublicActivity::Activity.where(owner_id: current_user.id, key: 'progression.create').order('created_at DESC').first
    @quote = Quote::ARRAY.sample

    @questions = current_user.questions.where(mentor_post: false).order("created_at DESC").limit(5)
    @submissions = current_user.submissions.all.order("created_at DESC").limit(5)

    @last_mentor_session = current_user.mentor_sessions.last unless current_user.mentor

    @activities = PublicActivity::Activity.all.order('created_at DESC').limit(20)

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
      @unresolved_questions = Question.where(resolved: false)
      @unapproved_submissions = Submission.where(approved: false)
    end
  end

  def courses
    @cards = current_user.cards.where(repetition_date: nil)
    @cards += current_user.cards.today

    @activities = PublicActivity::Activity.where(owner_id: current_user.id)
    @lessons = PublicActivity::Activity.where(owner_id: current_user.id, key: 'progression.create')
    @flashcards = PublicActivity::Activity.where(owner_id: current_user.id, key: 'flashcard.complete')
    @last_lesson = PublicActivity::Activity.where(owner_id: current_user.id, key: 'progression.create').order('created_at DESC').first

  end

  def activity_log
    if current_user.admin
      @activities = PublicActivity::Activity.all.order('created_at DESC').limit(20)
    else
      @activities = PublicActivity::Activity.where(owner_id: current_user.id).order('created_at DESC').limit(20)
    end
  end

  def guidelines
  end

  def curriculum
    render layout: "landing_page"
  end

  def about
    render layout: "landing_page"
  end

  def pricing
    render layout: "landing_page"
  end

  def contact_us
    render layout: "landing_page"
  end

  def congratulations
    render layout: "landing_page"
  end

  def learn
    render layout: "landing_page"
  end

  def preregistration
    render layout: 'preregistration'
  end

  def support
    render layout: "landing_page"
  end

end
