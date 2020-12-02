# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'policy'

class PolicyTest < Minitest::Test
  def test_new
    policy = Policy.new('a', 1, 3)

    assert policy.letter == 'a'
    assert policy.range == (1..3)
  end
end
