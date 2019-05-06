require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'as a project_enablr' do
    before(:each) do
      @project = FactoryBot.create(:random)
      @perk = FactoryBot.build(:random_perk_without_project)
      @perk.project_id = @project.id

      @user = FactoryBot.create(:standard)

      @enablr = FactoryBot.build(:enablr)

      @enablr.perk_id = @perk.id
      @enablr.project_id = @project.id
      @enablr.user_id = @user.id

      @enablr.save
    end

    it 'can create a comment' do
      comment = @enablr.comments.new(
        content: 'Test comment'
      )

      expect(comment).to be_valid
    end

    it 'is invalid without content' do
      comment = @enablr.comments.new(
        content: ''
      )

      expect(comment).not_to be_valid
    end
  end
end
