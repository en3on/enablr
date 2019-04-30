require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get sign up page' do
    get new_user_registration_path

    assert_response :success
  end

  test 'should create fundraiser new user' do
    @user = users(:one)
    user = User.new(
      email: Faker::Internet.email,
      password: @user.encrypted_password,
      password_confirmation: @user.encrypted_password,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      fundraiser: @user.fundraiser,
      country: @user.country,
      city: @user.city
    )

    assert(user.save, user.errors.each { |k, v| puts "#{k}: #{v}" })
  end

  test 'should delete user' do

  end

end
