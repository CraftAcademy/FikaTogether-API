RSpec.describe Department, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :name }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:participants) }
  end

  describe 'FactoryBot' do
    it 'is expected to have a valid Factory' do
      expect(create(:department)).to be_valid
    end
  end
end
