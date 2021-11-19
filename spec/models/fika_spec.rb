RSpec.describe Fika, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column :start_date }
    it { is_expected.to have_db_column :end_date }
    it { is_expected.to have_db_column :similarity }
    it { is_expected.to have_db_column :score }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :start_date }
    it { is_expected.to validate_presence_of :end_date }
    it { is_expected.to validate_presence_of :score}
  end

  describe 'Associations' do
    it { is_expected.to have_and_belong_to_many(:participants) }
  end

  describe 'FactoryBot' do
    it 'is expected to have a valid Factory' do
      expect(create(:fika)).to be_valid
    end
  end
end
