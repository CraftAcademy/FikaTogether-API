require 'rails_helper'

RSpec.describe Fika, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column :start_date }
    it { is_expected.to have_db_column :end_date }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :start_date }
    it { is_expected.to validate_presence_of :end_date }
  end

  describe 'Associations' do
  end

  describe 'FactoryBot' do
    it 'is expected to have a valid Factory' do
      expect(create(:fika)).to be_valid
    end
  end
end
