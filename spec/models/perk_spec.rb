require 'rails_helper'

RSpec.describe Perk, type: :model do
  describe 'as a project owner' do

    before(:each) do
      @perk = build(:unlimited_perk)
    end

    context 'with valid parameters' do

      it 'can create a new perk' do
        expect(@perk).to be_valid
      end

    end

    context 'with invalid parameters' do

      it 'is invalid without a name' do
        @perk.name = nil
        expect(@perk).not_to be_valid
      end

      it 'is invalid without a minimum_amount' do
        @perk.minimum_amount = nil
        expect(@perk).not_to be_valid
      end

      it 'is invalid without a rewards description' do
        @perk.rewards = nil
        expect(@perk).not_to be_valid
      end

    end
  end
end
