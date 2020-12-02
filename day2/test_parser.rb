# frozen_string_literal: true

require 'minitest/autorun'

require_relative 'parser'
require_relative 'password'
require_relative 'policy'
require_relative 'position_policy'

class ParserTest < Minitest::Test
  def test_parse_line
    parser = Parser.new(Policy)

    line = '2-7 p: pbhhzpmppb'
    expected_policy = Policy.new('p', 2, 7)
    expected_password = Password.new('pbhhzpmppb')

    assert_equal parser.parse_line(line), [expected_policy, expected_password]
  end

  def test_parse_line_takes_policy_class
    parser = Parser.new(PositionPolicy)

    line = '2-7 p: pbhhzpmppb'
    expected_policy = PositionPolicy.new('p', 2, 7)
    expected_password = Password.new('pbhhzpmppb')

    assert_equal parser.parse_line(line), [expected_policy, expected_password]
  end

  def test_parse_line2
    parser = Parser.new(Policy)

    line = '14-20 c: cccvcccccccrcccccpcc'
    expected_policy = Policy.new('c', 14, 20)
    expected_password = Password.new('cccvcccccccrcccccpcc')

    assert_equal parser.parse_line(line), [expected_policy, expected_password]
  end

  def test_parse_lines
    parser = Parser.new(Policy)

    lines = [
      '1-10 k: kkkknqxfszj',
      '14-16 j: jfjnbjmttjvwkjhq',
      '1-4 h: hhhhhhhhhhh'
    ]

    expected_results = [
      [Policy.new('k', 1, 10), Password.new('kkkknqxfszj')],
      [Policy.new('j', 14, 16), Password.new('jfjnbjmttjvwkjhq')],
      [Policy.new('h', 1, 4), Password.new('hhhhhhhhhhh')]
    ]

    assert_equal parser.parse_lines(lines), expected_results
  end
end
