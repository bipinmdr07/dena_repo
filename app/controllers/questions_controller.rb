class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permissions, only: [:edit, :update, :destroy]

  Reply = Struct.new(:reply, :user)

  def index
    @questions = current_user.questions.all.order("created_at DESC")
  end

  def show
    @question = Question.includes(:user, replies: :user).find(params[:id])  
    
    create_replies_array
    
    @user = @question.user
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    set_mentor_post        

    if @question.save      
      send_email_notification!      
      send_slack_notification!
    
      redirect_to question_path(@question.id)
    else
      flash[:alert] = "Invalid attributes, please try again."
      redirect_to new_question_path(lesson_id: question_params[:lesson_id], course_name: question_params[:course_name])
    end
  end  

  def edit

  end

  def update
    if @question.update(question_params)
      flash[:success] = "Updated!"
      redirect_to question_path(@question.id)
    else
      flash[:alert] = "Woops! It looks like there has been an error. Please try again."
      render :edit
    end
  end

  def destroy  
    @question.destroy

    if @question.mentor_post
      redirect_to community_path
    else
      back_to_lesson_url = PreviousLessonUrlBuilder.new(@question).url      
      redirect_to back_to_lesson_url 
    end    

  end

  private

  def create_replies_array
    @replies = []
    @question.replies.each do |reply|
      @replies << Reply.new(reply, reply.user)
    end
  end

  def set_mentor_post
    @question.mentor_post = true if current_user.mentor
  end

  def send_email_notification!
    UserMailer.new_question(@question).deliver_now
  end

  def send_slack_notification!
    post_type = @question.mentor_post ? "mentor post" : "question"

    Slack.chat_postMessage(text: 'New ' + post_type + ': <' + question_url(@question) + '|' + @question.title + '> by ' + @question.user_name, 
        username: 'TECHRISE Bot', 
        channel: "#forum_questions", 
        icon_emoji: ":smile_cat:") if Rails.env.production?
  end

  def check_permissions
    @question = Question.friendly.find(params[:id])
    return if current_user.admin || (@question.user == current_user)
    flash[:alert] = "Unauthorized!"
    redirect_to question_path(@question) 
  end

  def question_params
    params.require(:question).permit(:title, :content, :lesson_id, :course_name, :user_id, :mentor_post)
  end
end
