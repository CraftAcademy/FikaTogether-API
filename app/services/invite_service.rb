module InviteService
  def self.create_invite(fika)
    authorize_client
    get_attendees(fika)
    format_event(fika)
    event = @client.insert_event(
      'thisiscode@this-is-code.iam.gserviceaccount.com',
      @event_data,
      send_notifications: false,
      conference_data_version: 1
    )
    binding.pry
  end

  private_class_method def self.authorize_client
    lock = Lockbox.new(key: Lockbox.master_key)
    scopes = [
      'https://www.googleapis.com/auth/calendar',
      'https://www.googleapis.com/auth/calendar.events'
    ]
    File.open('google_credentials.json', 'w') do |f|
      f.puts lock.decrypt(File.open('google_credentials.enc.json'))
    end
    authorization = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open('google_credentials.json'),
      scope: scopes
    )
    File.delete('google_credentials.json') if File.exist?('google_credentials.json')
    @client = Google::Apis::CalendarV3::CalendarService.new
    @client.authorization = authorization
    @client.authorization.fetch_access_token!
  end

  private_class_method def self.get_attendees(fika)
    @attendees = fika.participants.pluck(:email).map do |email|
      { email: email, role: 'owner' }
    end
  end

  private_class_method def self.format_event(fika)
    attendee_1, attendee_2 = fika.participants.pluck(:name)
    @event_data = {
      summary: "Fika for #{attendee_1} and #{attendee_2}",
      start: { date_time: DateTime.now },
      end: { date_time: DateTime.now + 45.minutes },
      attendees: @attendees,
    }
  end
end
