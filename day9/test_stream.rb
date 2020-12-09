# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'stream'

describe Stream do
  describe 'validate' do
    it 'raises an exception if the encoding is invalid' do
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

      exception = assert_raises(InvalidInput) { stream.validate }

      assert_equal(exception.message, '127')
    end
  end
end
