# frozen_string_literal: true

require 'minitest/autorun'

require_relative 'password'

class PasswordTest < Minitest::Test
  def test_new
    password = Password.new('abcde')

    assert password.value == 'abcde'
  end
end
