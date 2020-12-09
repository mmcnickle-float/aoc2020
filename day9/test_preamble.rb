# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'preamble'

describe Preamble do
  describe '#valid_next_number?' do
    it 'returns true or false' do
      previous_numbers = (1..25).to_a

      preamble = Preamble.new(previous_numbers)

      assert(preamble.valid_next_number?(26) == true)
      assert(preamble.valid_next_number?(49) == true)
      assert(preamble.valid_next_number?(100) == false)
      assert(preamble.valid_next_number?(50) == false)
    end

    it 'returns true or false' do
      previous_numbers = (1..19).to_a + (21..25).to_a + [45]

      preamble = Preamble.new(previous_numbers)

      assert(preamble.valid_next_number?(26) == true)
      assert(preamble.valid_next_number?(64) == true)
      assert(preamble.valid_next_number?(65) == false)
      assert(preamble.valid_next_number?(66) == true)
      assert(preamble.valid_next_number?(100) == false)
      assert(preamble.valid_next_number?(50) == true)
    end
  end
end
