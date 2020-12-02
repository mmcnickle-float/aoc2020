# frozen_string_literal: true

class PositionPolicy
  attr_reader :letter, :first_position, :second_position

  def initialize(letter, first_position, second_position)
    @letter = letter
    @first_position = first_position
    @second_position = second_position
  end

  def valid?(password)
    chars = password.value.chars

    letter_position1 = chars[first_position - 1]
    letter_position2 = chars[second_position - 1]

    (letter == letter_position1) ^ (letter == letter_position2)
  end

  def ==(other)
    letter == other.letter &&
      first_position == other.first_position &&
      second_position == other.second_position
  end

  def to_s
    "<PositionPolicy letter:#{letter} first_position:#{first_position} second_position:#{second_position}>"
  end
end
