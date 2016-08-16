class EventsController < ApplicationController
  def index
    @upcoming_events = Event.where("datetime > ?", DateTime.now)
    @past_events = Event.where("datetime < ?", DateTime.now)
    render layout: "event_page"
  end

  def show
    @event = Event.find(params[:id])
    render layout: "event_page"
  end
end
