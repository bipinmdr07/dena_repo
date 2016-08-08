class QuestionDownvotesController < ApplicationController
  before_action :authenticate_user!

  respond_to :js, :html, :json

  def create
    @question = Question.friendly.find(params[:id])
    @question.downvote_from current_user

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end
