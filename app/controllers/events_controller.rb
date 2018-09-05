class EventsController < ApplicationController
  def new_calendar
    cal_file = File.open("odd_week.ics")
    cals = Icalendar::Calendar.parse(cal_file)
    events = cals.first.events
    events.each do |event|
      Event.create!(start_time: event.dtstart, end_time: event.dtend, place: event.location, title: build_title(event.summary))
    end
  end

  private

  def build_title(input)
    input.class == Icalendar::Values::Array ? input.join(", ") : input
  end
end
