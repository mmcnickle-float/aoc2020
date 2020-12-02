# frozen_string_literal: true

require "awesome_print"

class Password
  def initialize(value)
    @value = value
  end

  def valid?(policy)
    letter_frequencies = value.chars.tally

    letter_frequency = letter_frequencies[policy.letter]
    policy.range.include?(letter_frequency)
  end

  private

  attr_reader :value
end
