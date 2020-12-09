# frozen_string_literal: true

require_relative 'preamble'

class InvalidInput < StandardError; end

Stream = Struct.new(:input, :preamble_size) do
  def first_invalid_number
    input_indexes = preamble_size...input.length

    input_indexes.each do |i|
      number = input[i]

      preamble_index = i - preamble_size
      preamble = Preamble.new(input.slice(preamble_index, preamble_size))

      return number unless preamble.valid_next_number?(number)
    end

    nil
  end

  def contiguous_sum_list(target)
    window_sizes = 2..input.length

    window_sizes.each do |window_size|
      input.each_index do |i|
        trial = input.slice(i, window_size)
        return trial if trial.sum == target
      end
    end

    nil
  end

  def self.from_file(file, preamble_size)
    input = file.lines.map(&:to_i)
    new(input, preamble_size)
  end
end
