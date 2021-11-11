module InviteService
  def self.create_invite(fika)
    #WIP
    calendar = Google::Apis::CalendarV3::CalendarService.new
    authorizer = Google::Auth::ServiceAccountCredentials.make_creds(json_key_io: File.open('google_credentials.json'), scope: scopes)
    event_data = { summary: 'Test event', 
      start: { date_time: DateTime.now }, 
    end: { date_time: DateTime.now + 30.minutes } 
  }
    event = calendar.insert_event('thisiscode@this-is-code.iam.gserviceaccount.com', event_data, send_notifications: false)
  end
end
