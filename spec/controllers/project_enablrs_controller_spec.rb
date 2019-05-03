require 'rails_helper'

RSpec.describe ProjectEnablrsController, type: :controller do
  context 'with valid parameters' do
    before(:each) do
      @project = create(:random)
      @user = create(:standard)
    end

    it 'can enable a project' do
      post '/project_enablrs', params: {
        project_id: @project.id,
        user_id: @user.id
      }
    end
  end
end
