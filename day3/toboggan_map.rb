# frozen_string_literal: true

class TobogganMap
  attr_reader :width, :height

  def initialize(tree_data)
    row_data = tree_data.split(/\n/)

    @tree_positions = row_data.map(&:chars)

    @width = tree_positions[0].count
    @height = tree_positions.count
  end

  def tree?(x, y)
    # Don't loop in y direction
    raise(ArgumentError, 'y is beyond map extents') if y >= height

    # Loop in x direction
    x = x % width

    tree_positions[y][x] == '#'
  end

  private

  attr_reader :tree_positions
end
