# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'password'
require_relative 'policy'

# 1-3 a: abcde
# 1-3 b: cdefg
# 2-9 c: ccccccccc

class PasswordTest < Minitest::Test
  def test_password_valid
    test_cases = [
      [Password.new('abcde'), Policy.new('a', 1, 3)],
      [Password.new('ccccccccc'), Policy.new('c', 2, 9)]
    ]

    test_cases.each do |password, policy|
      assert password.valid?(policy)
    end
  end

  def test_password_invalid
    test_cases = [
      [Password.new('abcde'), Policy.new('a', 2, 3)],
      [Password.new('cdefg'), Policy.new('b', 1, 3)]
    ]

    test_cases.each do |password, policy|
      assert !password.valid?(policy)
    end
  end
end
