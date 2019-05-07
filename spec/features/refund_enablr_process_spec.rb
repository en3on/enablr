require 'rails_helper'

RSpec.feature "Refund Enablr Processes", type: :feature do

  include ProjectEnablrMacros

  describe 'as a project enablr' do
    context 'within 30 days of enabling a project' do
      before(:each) do
        @perk = create(:unlimited_perk)

        login_fundraiser
      end

      it 'can refund an enable' do
        enable_project
      end
    end
  end
end
