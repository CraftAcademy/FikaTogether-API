RSpec.describe 'InviteService', type: :service do
  describe 'successfully', sad_mock: false do
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

  describe 'unsuccessfully' do
    it 'is expected to return http status of a 401 status response when unauthorized', sad_token_mock: true do
      # this does not pass if we do not first test that it raises an error for some reason
      expect { create(:fika) }.to raise_error("We are experiencing problems with Google calendar at the moment, please try again later!")
      expect(
        @sad_token_response.response.status.first
      ).to eq 401
    end

    it 'is expected to return http status of a 400 code on bad request', sad_create_event_mock: true do
      expect { create(:fika) }.to raise_error("We are experiencing problems with Google calendar at the moment, please try again later!")
      expect(
        @sad_create_event_response.response.status.first
      ).to eq 400
    end
  end
end
