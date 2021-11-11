RSpec.describe Department, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :average_score }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :average_score }
  end

  describe 'Associations' do
    it { is_expected.to have_and_belong_to_many(:participants) }
  end

  describe 'FactoryBot' do
    it 'is expected to have a valid Factory' do
      expect(create(:department)).to be_valid
    end
  end
end
