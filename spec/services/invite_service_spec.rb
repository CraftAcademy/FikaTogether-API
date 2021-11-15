RSpec.describe 'InviteService', type: :service do
  let!(:fika) { create(:fika) }

  it 'is expected to call google api auth service' do
    expect(
      a_request(:post, %r{https://www.googleapis.com/oauth2/v4/token})
    ).to have_been_made.at_least_once
  end

  it 'is expected to call google api calendar service' do
    expect(
      a_request(:post, %r{https://www.googleapis.com/calendar/v3/calendars/})
    ).to have_been_made.at_least_once
  end
end
