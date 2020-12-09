# frozen_string_literal: true

Preamble = Struct.new(:previous_numbers) do
  def valid_next_number?(number)
    trials = previous_numbers.map do |previous_number|
      trial = number - previous_number

      next if trial == previous_number

      trial
    end

    possible_numbers = previous_numbers.intersection(trials)
    possible_numbers.length >= 2
  end
end
