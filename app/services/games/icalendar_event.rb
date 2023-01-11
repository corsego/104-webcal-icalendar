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
      # e.ip_class = "PRIVATE"
      e.ip_class = "PUBLIC"
      e.location = @game.address
      e.uid = "gameid:#{@game.id.to_s}"
      e.sequence = Time.now.to_i
      e.url = game_url(@game)
      e.organizer = Icalendar::Values::CalAddress.new("mailto:#{ApplicationMailer.default_params[:from]}", cn: 'Yaro from Superails') 
      e.attendee = Icalendar::Values::CalAddress.new("mailto:your@email.com", partstat: 'accepted') 
      # e.status = 'CANCELLED'
    end
    cal.publish
    cal.ip_method = 'REQUEST'
    cal.to_ical
  end
end