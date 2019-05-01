require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
    @project = projects(:software)
  end

  test 'valid project' do
    assert @project.valid?
  end

  test 'invalid without name' do
    @project.name = nil
    refute @project.valid?
    assert_not_nil @project.errors[:name], 'no validation error for name presence'
  end

  test 'invalid without description' do
    @project.description = nil
    refute @project.valid?
    assert_not_nil @project.errors[:description], 'no validation error for description presence'
  end

  test 'invalid with description too long' do
    @project.description = (0..26).map { ('a'..'z').to_a }.join
    refute @project.valid?
    assert_not_nil @project.errors[:description], 'no validation error for description length'
  end

  test 'invalid without target amount' do
    @project.target_amount = nil
    refute @project.valid?
    assert_not_nil @project.errors[:target_amount], 'no validation error for target_amount presence'
  end

  test 'invalid with target_amount not greater than 0' do
    @project.target_amount = 0
    refute @project.valid?
    assert_not_nil @project.errors[:target_amount], 'no validation error for target_amount numericality'
  end

  test 'invalid without target_date' do
    @project.target_date = nil
    refute @project.valid?
    assert_not_nil @project.errors[:target_date], 'no validation error for target_date presence'
  end
end
