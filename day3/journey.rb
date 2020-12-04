# frozen_string_literal: true

require 'matrix'

class Journey
  def initialize(map)
    @map = map
  end

  def count_trees(slope)
    position = Vector[0, 0]

    num_trees = 0

    loop do
      position += slope

      if map.tree?(position[0], position[1])
        num_trees += 1
      end

    rescue ArgumentError
      break
    end

    num_trees
  end

  private

  attr_reader :map
end
