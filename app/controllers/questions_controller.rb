class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = current_user.questions.all.order("created_at DESC")
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.create(question_params)

    if @question.valid?
      user = User.find(@question.user_id)
      UserMailer.new_question(@question).deliver_now
      Slack.chat_postMessage(text: 'New question: <' + question_url(@question) + '|' + @question.title + '> by ' + user.name, 
        username: 'TECHRISE Bot', 
        channel: "#forum_questions", 
        icon_emoji: ":smile_cat:") if Rails.env.production?
      redirect_to question_path(@question.id)
    else
      flash[:alert] = "Invalid attributes, please try again."
      redirect_to new_question_path(lesson_id: question_params[:lesson_id], course_name: question_params[:course_name])
    end
  end

  def show
    @question = Question.find(params[:id])
    @user = User.find(@question.user_id)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to :back
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :lesson_id, :course_name, :user_id)
  end
end
