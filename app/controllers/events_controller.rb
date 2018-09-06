class EventsController < ApplicationController
  def new_calendar
    @events = Event.all
  end

  def create_calendar

  end
end
