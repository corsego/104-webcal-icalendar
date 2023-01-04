class Game < ApplicationRecord
  # require 'icalendar'
  # include Rails.application.routes.url_helpers

  # def to_icalendar
  #   # Create a calendar with an event (standard method)
  #   cal = Icalendar::Calendar.new
  #   cal.event do |e|
  #     e.dtstart = starts_at
  #     e.dtend = ends_at
  #     e.summary = title
  #     e.description = description
  #     e.ip_class = "PRIVATE" # PUBLIC
  #     e.location = address
  #     e.uid = id.to_s
  #     e.sequence = Time.now.to_i
  #     e.url = game_url(self)
  #   end
  #   cal.publish
  #   cal.to_ical
  # end
end
