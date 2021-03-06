# frozen_string_literal: true

class Policy
  attr_reader :letter, :range

  def initialize(letter, at_least, at_most)
    @letter = letter
    @range = (at_least..at_most)
  end

  def valid?(password)
    letter_frequencies = password.value.chars.tally

    letter_frequency = letter_frequencies[letter]
    range.include?(letter_frequency)
  end

  def ==(other)
    letter == other.letter &&
      range == other.range
  end

  def to_s
    "<Policy letter:#{letter} range:#{range}>"
  end
end
