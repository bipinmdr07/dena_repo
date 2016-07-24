class CommunityController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @questions = Question.includes(:replies).order("created_at DESC").paginate(page: params[:page], per_page: 15)
  end
end
