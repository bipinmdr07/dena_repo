class TracksController < ApplicationController
  before_action :authenticate_user!

  def show
    @track = Course::TRACKS[params[:id].to_i - 1]    
  end
end
