require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:fundraiser)
  end

  test 'invalid without first_name' do
    @user.first_name = nil
    refute @user.valid?
    assert_not_nil @user.errors[:first_name], 'no validation error for first_name presence'
  end

  test 'invalid without last_name' do
    @user.last_name = nil
    refute @user.valid?
    assert_not_nil @user.errors[:last_name], 'no validation error for last_name presence'
  end

  test 'invalid without country' do
    @user.country = nil
    refute @user.valid?
    assert_not_nil @user.errors[:country], 'no validation error for country presence'
  end

  test 'invalid without city' do
    @user.city = nil
    refute @user.valid?
    assert_not_nil @user.errors[:city], 'no validation error for city presence'
  end
end
