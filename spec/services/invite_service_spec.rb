RSpec.describe 'InviteService', type: :service do
  let(:fika) { create(:fika, participants: [participant_1, participant_2]) }
  let(:participant_1) { create(:participant) }
  let(:participant_2) { create(:participant) }
  it 'is expected to call google api calendar service' do
    InviteService.create_invite(fika)
    binding.pry
  end
end
