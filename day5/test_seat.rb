# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'seat'

TestCase = Struct.new(:code, :row, :column)

describe Seat do
  describe '.from_code' do
    it 'returns an instance of the decoded seat' do
      test_cases = [
        TestCase.new('FBFBBFFRLR', 44, 5),
        TestCase.new('BFFFBBFRRR', 70, 7),
        TestCase.new('FFFBBBFRRR', 14, 7),
        TestCase.new('BBFFBBFRLL', 102, 4)
      ]

      test_cases.each do |test_case|
        expected_seat = Seat.new(test_case.row, test_case.column)
        seat = Seat.from_code(test_case.code)

        assert_equal(expected_seat, seat)
      end
    end
  end

  describe '#id' do
    it 'returns the seat id' do
      assert_equal(357, Seat.new(44, 5).id)
      assert_equal(567, Seat.new(70, 7).id)
      assert_equal(119, Seat.new(14, 7).id)
      assert_equal(820, Seat.new(102, 4).id)
    end
  end
end
