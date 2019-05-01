require 'rails_helper'

RSpec.describe "UserManagements", type: :request do
  describe "GET /user_managements" do
    it "works! (now write some real specs)" do
      get user_managements_path
      expect(response).to have_http_status(200)
    end
  end
end
