# frozen_string_literal: true

class Layout
  attr_reader :width, :height

  def initialize(grid)
    @grid = grid

    @width = grid[0].count
    @height = grid.count
  end

  def [](x, y)
    grid[y][x]
  end

  def []=(x, y, state)
    grid[y][x] = state
  end

  def adjacent_states(x, y)
    rows = (y - 1)..(y + 1)
    columns = (x - 1)..(x + 1)

    rows = rows.reject { |i| i.negative? || i >= height }
    columns = columns.reject { |j| j.negative? || j >= width }

    rows.flat_map do |i|
      columns.filter_map do |j|
        next if i == y && j == x

        grid[i][j]
      end
    end
  end

  def self.from_string(data)
    grid = data.split(/\n/).map(&:chars)

    new(grid)
  end

  def copy
    grid_copy = Marshal.load(Marshal.dump(grid))

    Layout.new(grid_copy)
  end

  private

  attr_reader :grid
end
