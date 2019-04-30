require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_params = users(:one)
    @user = User.new(
      email: Faker::Internet.email,
      password: @user_params.encrypted_password,
      password_confirmation: @user_params.encrypted_password,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      fundraiser: @user_params.fundraiser,
      country: @user_params.country,
      city: @user_params.city
    )
  end

  test 'should get sign up page' do
    get new_user_registration_path

    assert_response :success
  end

  test 'should create new fundraiser user' do
    @user.fundraiser = true

    @user.save

    user = User.find(@user.id)

    assert_equal true, user.fundraiser, "User's fundraiser status is #{user.fundraiser}. Should be true!"
  end

  test 'should delete user' do

  end

end
