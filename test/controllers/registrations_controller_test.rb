require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should create new user' do
    post user_registration_path, params: {
      email: @user.email,
      password: @user.password,
      password_confirmation: @user.password_confirmation,
      first_name: @user.first_name,
      last_name: @user.last_name,
      fundraiser: @user.fundraiser,
      country: @user.country,
      city: @user.city
    }

    assert_response :success
  end
  
end
