# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'stream'

describe Stream do
  let(:invalid_input) do
    [
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
  end

  let(:valid_input) do
    [
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
  end

  describe '#first_invalid_number' do
    it 'returns the first invalid number' do
      stream = Stream.new(invalid_input, 5)
      assert_equal(stream.first_invalid_number, 127)
    end

    it 'returns nil if no invalid numbers' do
      stream = Stream.new(valid_input, 5)
      assert_nil(stream.first_invalid_number)
    end
  end

  describe '#contiguous_sum_list' do
    it 'returns the contiguous list of number that sum to the target' do
      stream = Stream.new(invalid_input, 5)

      expected_list = [15, 25, 47, 40]
      assert_equal(expected_list, stream.contiguous_sum_list(127))
    end

    it 'returns nil if no list exists' do
      stream = Stream.new(invalid_input, 5)

      assert_nil(stream.contiguous_sum_list(128))
    end
  end
end
