# frozen_string_literal: true

require_relative 'preamble'

class InvalidInput < StandardError; end

Stream = Struct.new(:input, :preamble_size) do
  def validate
    preamble_index = 0
    input_index = preamble_size

    loop do
      preamble = Preamble.new(input.slice(preamble_index, preamble_size))
      number = input[input_index]
      is_valid = preamble.valid_next_number?(number)

      # puts preamble.inspect
      # puts number.inspect
      # puts is_valid

      raise(InvalidInput, number) if is_valid == false

      preamble_index += 1
      input_index += 1
    end
  end

  def self.from_file(file, preamble_size)
    input = file.lines.map(&:to_i)
    new(input, preamble_size)
  end
end
