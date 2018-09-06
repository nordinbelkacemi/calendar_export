class EventsController < ApplicationController
  def new_events
    if user_signed_in?
      @user = current_user
      if @user.events.count == 0
        calendar_file = File.open("public/#{current_user.calendar.url}")
        cals = Icalendar::Calendar.parse(calendar_file)
        events = cals.first.events
        events.each do |event|
          Event.create!(user: current_user, start_time: event.dtstart, end_time: event.dtend, place: event.location, title: build_title(event.summary))
        end
      end
    else
      @user = User.new
    end
  end

  def create_calendar
  end

  private

  def build_title(input)
    input.class == Icalendar::Values::Array ? input.join(", ") : input
  end
end
