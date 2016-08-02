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
