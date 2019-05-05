require 'test_helper'

class PerkTest < ActiveSupport::TestCase
  describe 'as an unlimited perk' do
    context 'with valid parameters' do
      before(:each) do
        @perk = build(:unlimited)
      end
    end
  end
end
