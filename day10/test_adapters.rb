# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'adapters'

describe Adapters do
  describe '#joltage_differences' do
    it 'returns a list of the joltage differences' do
      joltages = [
        16,
        10,
        15,
        5,
        1,
        11,
        7,
        19,
        6,
        12,
        4
      ]

      adapters = Adapters.new(joltages)

      expected_joltage_differences = [1, 3, 1, 1, 1, 3, 1, 1, 3, 1, 3, 3]

      assert_equal(expected_joltage_differences, adapters.joltage_differences)
    end
  end

  describe '#joltage_distribution' do
    it 'returns a list of the joltage differences' do
      joltages = [
        16,
        10,
        15,
        5,
        1,
        11,
        7,
        19,
        6,
        12,
        4
      ]

      adapters = Adapters.new(joltages)

      expected_joltage_distribution = {
        1 => 7,
        3 => 5
      }

      assert_equal(expected_joltage_distribution, adapters.joltage_distribution)
    end
  end
end
