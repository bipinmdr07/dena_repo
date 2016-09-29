class CommunityController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:query].present?
      @questions = Question.search(params[:query])
      					   .page(params[:page])
      					   .records
      					   
    else
      @questions = Question.order("created_at DESC")
      				             .paginate(page: params[:page], per_page: 10)
      				       
    end
  end
end
