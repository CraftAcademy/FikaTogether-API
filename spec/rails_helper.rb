require 'webmock/rspec'
require 'spec_helper'
require 'simplecov'
SimpleCov.start
# WebMock.disable_net_connect!(allow: 'www.googleapis.com/oauth2/v4/token')

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |file| require file }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
  config.include Shoulda::Matchers::ActiveRecord, type: :model
  config.include ResponseJSON
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

token_response = {
  "access_token": 'ya29.c.b0AXv0zTMPFtArShoEM6xESj9-sasvqkk3sfmkfLNy5hBTiA8-Tdb63pb3NWf1Nnpk3g4TNzaA8o3brEpoRbvXQtTt1qfflHc_xpQSuoOqQrZaMD9cNqLnNB3nv9XJoYj0HY1_cYHyeEy5QOIIwh8ZV_nmerHTVXZ-7TS71yKrK8nar4NNcpVShHCgAinQUQhjdiZnf7hQohcNFMNg73k4vnFdf2rAjIQ',
  "expires_in": 3599,
  "token_type": 'Bearer'
}.to_json

calendar_entry_success = {
  "kind": 'calendar#event',
  "etag": '"3273686551590000"',
  "id": '908sku07n4umfmmjftqi8302n8',
  "status": 'confirmed',
  "htmlLink": 'https://www.google.com/calendar/event?eid=OTA4c2t1MDduNHVtZm1tamZ0cWk4MzAybjggdGhpc2lzY29kZUB0aGlzLWlzLWNvZGUuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20',
  "created": '2021-11-13T22:41:15.000Z',
  "updated": '2021-11-13T22:41:15.795Z',
  "summary": 'Fika for Daniel Gulgowski and Mrs. Perry Runolfsson',
  "creator": {
    "email": 'thisiscode@this-is-code.iam.gserviceaccount.com',
    "self": true
  },
  "organizer": {
    "email": 'thisiscode@this-is-code.iam.gserviceaccount.com',
    "self": true
  },
  "start": {
    "dateTime": '2021-11-13T23:41:15+01:00',
    "timeZone": 'UTC'
  },
  "end": {
    "dateTime": '2021-11-14T00:26:15+01:00',
    "timeZone": 'UTC'
  },
  "iCalUID": '908sku07n4umfmmjftqi8302n8@google.com',
  "sequence": 0,
  "attendees": [
    {
      "email": 'jestine.huel@watsica.com',
      "responseStatus": 'needsAction'
    },
    {
      "email": 'octavia_schulist@schamberger-ziemann.net',
      "responseStatus": 'needsAction'
    }
  ],
  "reminders": {
    "useDefault": true
  },
  "eventType": 'default'
}.to_json

WebMock.stub_request(:post, %r{www.googleapis.com/oauth2/v4/token})
       .to_return(
         status: 200,
         body: token_response,
         headers: { content_type: 'application/json' }
       )

WebMock.stub_request(:post, %r{www.googleapis.com/calendar/v3/calendars/})
       .to_return(
         status: 200,
         body: calendar_entry_success,
         headers: { content_type: 'application/json' }
       )
