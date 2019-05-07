require 'rails_helper'

RSpec.describe ProjectEnablr, type: :model do
  # before(:each) do
  #   ProjectEnablr.destroy_all
  #   @project_enablr = build(:complete_project_enablr)
  #   @project = Project.find(@project_enablr.project_id)
  #   @user = create(:fundraiser)
  # end

  # context 'with valid parameters' do
  #   it 'can create a new project_enablr instance' do
  #     @project_enablr.user_id = @user.id
  #     expect(@project_enablr).to be_valid
  #   end
  # end

  # context 'with invalid parameters' do
  #   it 'is invalid without a user_id' do
  #     @project_enablr.project_id = @project.id

  #     expect(@project_enablr).not_to be_valid
  #   end

  #   it 'is invalid without a project_id' do
  #     @project_enablr.project_id = nil

  #     expect(@project_enablr).not_to be_valid
  #   end

  #   it 'is invalid without a pledged_amount' do
  #     @project_enablr.user_id = @user.id
  #     @project_enablr.project_id = @project.id

  #     @project_enablr.pledged_amount = nil

  #     expect(@project_enablr).not_to be_valid
  #   end

  #   it 'is invalid with a pledged_amount of less than 1' do
  #     @project_enablr.user_id = @user.id
  #     @project_enablr.project_id = @project.id

  #     @project_enablr.pledged_amount = 0

  #     expect(@project_enablr).not_to be_valid
  #   end
  # end

  # context 'when project has already been enabled' do
  #   before(:each) do
  #     @project_enablr = create(:complete_project_enablr)
  #   end
  # end

  # context 'as a fundraiser with a project' do
  #   before(:each) do
  #     @project_enablr = build(:complete_project_enablr)
  #     @project = Project.find(@project_enablr.project_id)
  #     @user = User.find(@project_enablr.user_id)

  #     @project.user_id = @user.id
  #     @project.save
  #   end

  #   it 'cannot enable own project' do
  #     expect(@project_enablr).not_to be_valid
  #   end
  # end
end
