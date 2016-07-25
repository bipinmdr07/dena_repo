class CommunityController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:query].present?
      @questions = Question.search(params[:query]).page(params[:page]).records.order(:created_at)
    else
      @questions = Question.includes(:replies).order("created_at DESC").paginate(page: params[:page], per_page: 10)
    end
    # @questions = Question.includes(:replies).order("created_at DESC").paginate(page: params[:page], per_page: 15)
    # @questions = Question.search(params)
  end
end
