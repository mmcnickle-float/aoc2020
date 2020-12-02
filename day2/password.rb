# frozen_string_literal: true

class Password
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def valid?(policy)
    letter_frequencies = value.chars.tally

    letter_frequency = letter_frequencies[policy.letter]
    policy.range.include?(letter_frequency)
  end

  def ==(other)
    value == other.value
  end

  def to_s
    "<Password value:#{value}>"
  end
end
