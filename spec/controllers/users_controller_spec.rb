require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'as a fundraiser' do
    before(:each) do
      @project = build(:random)
      @user = User.find(@project.user_id)
      @ability = Ability.new(@user)
    end

    it 'can create a new project' do
    end

  end
end
