require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before(:each) do
    Project.destroy_all
  end

  context 'GET index' do
    it 'assigns @projects' do
      project = FactoryBot.create(:software)
      get :index
      expect(assigns(:projects)).to eq([project])
    end
  end
end
