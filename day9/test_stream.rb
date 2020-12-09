# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'stream'

describe Stream do
  describe 'first_invalid_number' do
    it 'returns the first invalid number' do
      input = [
        35,
        20,
        15,
        25,
        47,
        40,
        62,
        55,
        65,
        95,
        102,
        117,
        150,
        182,
        127,
        219,
        299,
        277,
        309,
        576
      ]

      stream = Stream.new(input, 5)
      assert_equal(stream.first_invalid_number, 127)
    end
  end

  describe 'first_invalid_number' do
    it 'returns nil if no invalid numbers' do
      input = [
        35,
        20,
        15,
        25,
        47,
        40,
        62,
        55,
        65,
        95,
        102,
        117,
        150,
        182
      ]

      stream = Stream.new(input, 5)
      assert_nil(stream.first_invalid_number)
    end
  end
end
