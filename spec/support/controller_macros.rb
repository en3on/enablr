module ControllerMacros
  def login_fundraiser
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:fundraiser]
      fundraiser = FactoryBot.create(:fundraiser)
      sign_in fundraiser
    end
  end

  def login_standard
    before(:each) do
      @request.env['devise.mapping'] = Devise.mapping[:standard]
      standard = FactoryBot.create(:standard)
      sign_in standard
    end
  end
end
