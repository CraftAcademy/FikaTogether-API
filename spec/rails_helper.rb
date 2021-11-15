require 'webmock/rspec'
require 'spec_helper'
require 'simplecov'
SimpleCov.start
# WebMock.enable!

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
  config.before(sad_mock: false) do
    @token_response = WebMock.stub_request(:post, %r{www.googleapis.com/oauth2/v4/token.*})
                             .to_return(
                               status: 200,
                               body: file_fixture('token_response.json'),
                               headers: { content_type: 'application/json' }
                             )

    @create_event_response = WebMock.stub_request(:post, %r{www.googleapis.com/calendar/v3/calendars/.*})
                                    .to_return(
                                      status: 200,
                                      body: file_fixture('create_event_response.json'),
                                      headers: { content_type: 'application/json' }
                                    )
  end

  config.before(sad_mock: true) do
    @sad_token_response = WebMock.stub_request(:post, %r{www.googleapis.com/oauth2/v4/token.*})
                             .to_return(
                               status: 401,
                               body: file_fixture("unauthorized_token_response.json"),
                               headers: { content_type: 'application/json' }
                             )

    @sad_create_event_response = WebMock.stub_request(:post, %r{www.googleapis.com/calendar/v3/calendars/.*})
                                    .to_return(
                                      status: 400,
                                      body: file_fixture("bad_request_response.json"),
                                      headers: { content_type: 'application/json' }
                                    )
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
