RSpec.describe Participant, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :start_date }
    it { is_expected.to have_db_column :management }
    it { is_expected.to have_db_column :seniority }
    it { is_expected.to have_db_column :fika_score }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :start_date }
    it { should allow_value(true).for(:management) }
    it { should allow_value(false).for(:management) }
    it { is_expected.to validate_presence_of :seniority }
    it { is_expected.to validate_presence_of :fika_score }
  end

  describe 'Avatar' do
    subject { create(:participant).avatar }

    it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
  end

  describe 'Associations' do
    it { is_expected.to have_and_belong_to_many(:fikas) }
    it { is_expected.to belong_to(:department) }
  end

  describe 'FactoryBot' do
    it 'is expected to have a valid Factory' do
      expect(create(:participant)).to be_valid
    end
  end
end
