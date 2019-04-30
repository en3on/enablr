require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test 'should create new user' do
    assert_difference('User.count', +1) do
      post user_registration_path, params: { user: {
        email: 'user1@test.com',
        first_name: 'user1',
        last_name: 'test',
        fundraiser: 'false',
        country: 'Australia',
        city: 'Melbourne',
        password: 'password',
        password_confirmation: 'password'
      }}
    end
  end
end
