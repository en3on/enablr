require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { build(:software) }

  context 'with valid parameters' do

    it 'is valid' do
      expect(project).to be_valid
    end

  end

  context 'with invalid parameters' do

    it 'is invalid without a name' do
      project.name = nil
      expect(project).to_not be_valid
    end

    it 'is invalid without a description' do
      project.description = nil
      expect(project).to_not be_valid
    end

    it 'is invalid with a description longer than 500 chars' do
      project.description = 'a' * 600
      expect(project).to_not be_valid
    end

    it 'is invalid without a target amount' do
      project.target_amount = nil
      expect(project).to_not be_valid
    end

    it 'is invalid with a target_amount less than 1' do
      project.target_amount = 0
      expect(project).to_not be_valid
    end

    it 'is invalid without a target_date' do
      project.target_date = nil
      expect(project).to_not be_valid
    end

    it 'is invalid with a target_date in the past' do
      project.target_date = '1 January 2010'
      expect(project).to_not be_valid
    end
  end
end
