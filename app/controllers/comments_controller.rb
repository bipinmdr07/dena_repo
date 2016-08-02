class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_mentor!

  def create
    @comment = current_user.comments.new(comment_params) 
    if @comment.save
      flash[:success] = "Thank you for your contribution! :)"   
    else
      flash[:alert] = "Woops! It looks like there was an invalid form attribute!"
    end
    redirect_to student_question_path(params[:student_question_id])
  end

  def edit
    @comment = Comment.find_by(student_question_id: params[:student_question_id], id: params[:id])
    @student_question = StudentQuestion.find(params[:student_question_id])
  end

  def update
    @comment = Comment.find_by(student_question_id: params[:student_question_id], id: params[:id])

    if @comment.update
      flash[:success] = "Updated!"   
    else
      flash[:success] = "Thank you for your contribution! :)"   
    end

    redirect_to student_question_path(params[:student_question_id])
  end

  def destroy
    @comment = Comment.find_by(student_question_id: params[:student_question_id], id: params[:id])
    @comment.destroy
    redirect_to student_question_path(params[:student_question_id])
  end

  private

  def authenticate_mentor!
    return if current_user.mentor
    flash[:alert] = "Unauthorized"
    redirect_to root_path 
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :student_question_id).merge(student_question_id: params[:student_question_id])
  end
end
