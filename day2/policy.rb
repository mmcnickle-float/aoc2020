# frozen_string_literal: true

class Policy
  attr_reader :letter, :range

  def initialize(letter, at_least, at_most)
    @letter = letter
    @range = (at_least..at_most)
  end
end
