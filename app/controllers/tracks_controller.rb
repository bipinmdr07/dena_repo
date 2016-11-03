class TracksController < ApplicationController
  def show
    @track = Course::TRACKS[params[:id].to_i - 1]
  end
end
