require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:fundraiser) }

  context 'with valid parameters' do
    it 'is valid' do
      expect(user).to be_valid
    end
  end

  context 'with invalid parameters' do

    it 'is invalid without a first_name' do
      user.first_name = nil
      expect(user).to_not be_valid
    end

    it 'is invalid without a last_name' do
      user.last_name = nil
      expect(user).to_not be_valid
    end

    it 'is invalid without a country' do
      user.country = nil
      expect(user).to_not be_valid
    end

    it 'is invalid without a city' do
      user.city = nil
      expect(user).to_not be_valid
    end
  end
end
