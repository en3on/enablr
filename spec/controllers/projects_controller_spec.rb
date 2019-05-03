require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe 'as a fundraiser' do
    login_fundraiser

    context 'with valid parameters' do

      before(:each) do
        project = build(:random)
        @params = {
          name: project.name,
          description: project.description,
          target_amount: project.target_amount,
          target_date: project.target_date,
          country: project.country,
          city: project.city,
          category: project.category,
          user_id: nil
        }
        @project = create(:random)
      end

      it 'can create a project' do
        post :create, params: { project: @params }

        expect(response).to have_http_status(302)
      end
    end
  end
end
