require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest

  def create_user(user_params)
    @user = User.new(
      email: Faker::Internet.email,
      password: user_params.encrypted_password,
      password_confirmation: user_params.encrypted_password,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      fundraiser: user_params.fundraiser,
      country: user_params.country,
      city: user_params.city
    )

    @user.save
  end

  Minitest.after_run do
    User.destroy_all
  end

  test 'should get sign up page' do
    get new_user_registration_path

    assert_response :success
  end

  test 'should create new fundraiser user' do
    user_params = users(:fundraiser)

    create_user(user_params)

    assert_equal true, @user.fundraiser, 'User was not set as fundraiser!'
  end

  test 'should create new standard user' do
    user_params = users(:standard)

    create_user(user_params)

    assert_equal false, @user.fundraiser, 'User was set as fundraiser!'
  end

  test 'should delete user' do

  end

end
