class QuestionStatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin_or_questioner

  respond_to :js, :html, :json

  def create
    @question = Question.find(params[:id])
    if @question.resolved
      @question.update(resolved: false)
    else
      @question.update(resolved: true)
    end

    respond_to do |format|
      format.html {}
      format.js {}
    end

  end

  private

  def check_if_admin_or_questioner
    return if current_user.admin || @question.user_id == current_user
    flash[:alert] = "Unauthorized."
    redirect_to root_path
  end
end