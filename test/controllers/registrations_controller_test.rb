require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should create new user' do
    assert_difference('User.count', +1) do
      post user_registration_path, params: @user
    end
  end
end
