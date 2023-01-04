# Games::IcalendarEvent.new(game: Game.first).call
class Games::IcalendarEvent
  require 'icalendar'
  include Rails.application.routes.url_helpers

  def initialize(game:)
    @game = game
  end

  def call
    # Create a calendar with an event (standard method)
    cal = Icalendar::Calendar.new
    cal.event do |e|
      e.dtstart = @game.starts_at
      e.dtend = @game.ends_at
      e.summary = @game.title
      e.description = @game.description
      e.ip_class = "PRIVATE" # PUBLIC
      e.location = @game.address
      e.uid = @game.id.to_s
      e.sequence = Time.now.to_i
      e.url = game_url(@game)
    end
    cal.publish
    cal.to_ical
  end
end