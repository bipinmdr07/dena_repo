class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permissions, only: [:edit, :update, :destroy]

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
    course_name = @question.course_name.underscore + "s"
    lesson_name = Tags::LESSONS[course_name].keys[@question.lesson_id - 1][1]
    back_to_lesson_url = "/" + course_name + "/" + @question.lesson_id.to_s

    @question.destroy
    redirect_to back_to_lesson_url
  end

  private

  def check_permissions
    @question = Question.find(params[:id])
    return if current_user.admin || (@question.user_id == current_user.id)
    flash[:alert] = "Unauthorized!"
    redirect_to question_path(@question) 
  end

  def question_params
    params.require(:question).permit(:title, :content, :lesson_id, :course_name, :user_id)
  end
end
