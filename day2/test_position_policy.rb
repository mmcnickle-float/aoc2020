# frozen_string_literal: true

require 'minitest/autorun'

require_relative 'password'
require_relative 'position_policy'

class PositionPolicyTest < Minitest::Test
  def test_new
    policy = PositionPolicy.new('a', 1, 3)

    assert policy.letter == 'a'
    assert policy.first_position == 1
    assert policy.second_position == 3
  end

  def test_password_valid
    test_cases = [
      [Password.new('abcde'), PositionPolicy.new('a', 1, 3)]
    ]

    test_cases.each do |password, policy|
      assert policy.valid?(password)
    end
  end

  def test_password_invalid
    test_cases = [
      [Password.new('cdefg'), PositionPolicy.new('b', 1, 3)],
      [Password.new('ccccccccc'), PositionPolicy.new('c', 2, 9)]
    ]

    test_cases.each do |password, policy|
      assert !policy.valid?(password)
    end
  end
end
