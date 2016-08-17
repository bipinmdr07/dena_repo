class EventsController < ApplicationController
  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
    render layout: "event_page"
  end

  def show
    @event = Event.find(params[:id])
    render layout: "event_page"
  end
end
