require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'as a project_enablr' do
    before(:each) do
      @project = FactoryBot.create(:random)
      @perk = FactoryBot.build(:random_perk_without_projet)
      @perk.project_id = @project.id
      @perk.save

      @user = FactoryBot.create(:standard)

      @user.perks.new(@perk.to_params)
    end
  end
end
