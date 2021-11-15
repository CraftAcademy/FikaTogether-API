RSpec.describe 'InviteService', type: :service do
  let!(:fika) { create(:fika) }

  describe 'successfully', sad_mock: false do
    it 'is expected to call google api auth service' do
      expect(
        a_request(:post, %r{https://www.googleapis.com/oauth2/v4/token})
      ).to have_been_made.at_least_once
    end
  
    it 'is expected to call google api calendar service', mock: true do
      expect(
        a_request(:post, %r{https://www.googleapis.com/calendar/v3/calendars/})
      ).to have_been_made.at_least_once
    end
  
  end

  describe "unsuccessfully", sad_mock: true do
    
  end
end
