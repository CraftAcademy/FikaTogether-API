RSpec.describe 'InviteService', type: :service do
  let!(:fika) { create(:fika, participants: [participant_1, participant_2]) }
  let(:participant_1) { create(:participant) }
  let(:participant_2) { create(:participant) }

  # subject! { InviteService.create_invite(fika).to_h }

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

  it "is expected to return status :confirmed" do
    expect(JSON.parse(@create_event_response.response.body)["status"]).to eq 'confirmed'
  end
end
