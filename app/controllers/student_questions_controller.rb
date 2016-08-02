class StudentQuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_mentor!

  respond_to :js, :html, :json

  def index
    @student_questions = StudentQuestion.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def show
    @student_question = StudentQuestion.find(params[:id])
    @user = User.find(@student_question.user_id)
  end

  def new
    @student_question = StudentQuestion.new
  end

  def create
    @student_question = current_user.student_questions.new(student_question_params)

    if @student_question.save
      flash[:success] = "Thank you for your contribution! :)"
      redirect_to student_questions_path
    else
      flash[:alert] = "Woops! It looks like there was an invalid form attribute!"
      render_template :new
    end 

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def edit
    @student_question = StudentQuestion.find(params[:id])
  end

  def update
    @student_question = StudentQuestion.find(params[:id])
    if @student_question.update
      flash[:success] = "Edited! :)"
      redirect_to student_question_path(params[:id])
    else
      flash[:alert] = "Woops! It looks like there was an invalid form attribute!"
      render_template :edit
    end
  end

  def destroy
    @student_question = StudentQuestion.find(params[:id])
    flash[:success] = "Deleted!"
    @student_question.destroy
    redirect_to student_questions_path
  end

  private

  def student_question_params
    params.require(:student_question).permit(:title, :answer, :user_id)
  end

  def authenticate_mentor!
    return if current_user.mentor
    flash[:alert] = "Unauthorized"
    redirect_to root_path 
  end
end
