require 'rails_helper'

RSpec.describe ProjectEnablr, type: :model do
  before(:each) do
    ProjectEnablr.destroy_all
    @project = create(:random)
    @user = User.find(@project.user_id)
    @project_enablr = build(:project_enablr)
  end
  context 'with valid parameters' do
    it 'can create a new project_enablr instance' do
      @project_enablr.project_id = @project.id
      @project_enablr.user_id = @user.id

      expect(@project_enablr).to be_valid
    end
  end

  context 'with invalid parameters' do
    it 'is invalid without a user_id' do
      @project_enablr.project_id = @project.id

      expect(@project_enablr).not_to be_valid
    end

    it 'is invalid without a project_id' do
      @project_enablr.user_id = @user.id

      expect(@project_enablr).not_to be_valid
    end

    it 'is invalid without a pledged_amount' do
      @project_enablr.user_id = @user.id
      @project_enablr.project_id = @project.id

      @project_enablr.pledged_amount = nil

      expect(@project_enablr).not_to be_valid
    end

    it 'is invalid with a pledged_amount of less than 1' do
      @project_enablr.user_id = @user.id
      @project_enablr.project_id = @project.id

      @project_enablr.pledged_amount = 0

      expect(@project_enablr).not_to be_valid
    end
  end

  context 'when project has already been enabled' do
    before(:each) do
      @project_enablr = build(:complete_project_enablr)
      @project_enablr.save
    end

    it 'cannot enable the same project again' do
      expect(@project_enablr).not_to be_valid
    end
  end
end
