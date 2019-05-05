require 'rails_helper'

RSpec.describe Perk, type: :model do
  context 'with valid parameters' do
    before(:each) do
      @perk = build(:unlimited_perk)
    end

    it 'should be valid' do
      expect(@perk).to be_valid
    end

    it 'should be unlimited' do
      @perk.save
      expect(@perk.unlimited).to be true
    end

    it 'should be limited with an amount_left greater than -1' do
      @perk.amount_left = 0
      @perk.save
      expect(@perk.unlimited).to be false
    end
  end
end
