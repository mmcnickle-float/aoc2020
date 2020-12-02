# frozen_string_literal: true

require 'minitest/autorun'

require_relative 'parser'
require_relative 'password'
require_relative 'policy'

class ParserTest < Minitest::Test
  def test_parse_line2
    parser = Parser.new

    line = '2-7 p: pbhhzpmppb'
    expected_policy = Policy.new('p', 2, 7)
    expected_password = Password.new('pbhhzpmppb')

    assert_equal parser.parse_line(line), [expected_policy, expected_password]
  end

  def test_parse_line2
    parser = Parser.new

    line = '14-20 c: cccvcccccccrcccccpcc'
    expected_policy = Policy.new('c', 14, 20)
    expected_password = Password.new('cccvcccccccrcccccpcc')

    assert_equal parser.parse_line(line), [expected_policy, expected_password]
  end
end
