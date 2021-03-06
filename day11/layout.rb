# frozen_string_literal: true

require 'matrix'

class Layout
  attr_reader :grid, :width, :height

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

  def adjacent_tally(x, y)
    tally = adjacent_states(x, y).tally
    tally.default = 0

    tally
  end

  def all_line_of_sight_states(x, y)
    direction_vectors = [
      Vector[0, -1],
      Vector[1, -1],
      Vector[1, 0],
      Vector[1, 1],
      Vector[0, 1],
      Vector[-1, 1],
      Vector[-1, 0],
      Vector[-1, -1]
    ]

    direction_vectors.map do |direction_vector|
      direction_states = []
      target_vector = Vector[x, y]

      loop do
        target_vector += direction_vector

        i = target_vector[0]
        j = target_vector[1]

        break if i.negative? || i >= width
        break if j.negative? || j >= height

        direction_states << self[i, j]

        break if self[i, j] == '#' || self[i, j] == 'L'
      end

      direction_states
    end
  end

  def nearest_line_of_sight_states(x, y)
    direction_vectors = [
      Vector[0, -1],
      Vector[1, -1],
      Vector[1, 0],
      Vector[1, 1],
      Vector[0, 1],
      Vector[-1, 1],
      Vector[-1, 0],
      Vector[-1, -1]
    ]

    direction_vectors.filter_map do |direction_vector|
      state = nil
      target_vector = Vector[x, y]

      loop do
        target_vector += direction_vector

        i = target_vector[0]
        j = target_vector[1]

        break if i.negative? || i >= width
        break if j.negative? || j >= height

        state = self[i, j]

        break if state == '#' || state == 'L'
      end

      state unless state == '.'
    end
  end

  def self.from_string(data)
    grid = data.split("\n").map(&:chars)

    new(grid)
  end

  def to_s
    grid.map(&:join).join("\n") + "\n"
  end

  def copy
    Layout.from_string(to_s)
  end

  def next_state(x, y)
    state = self[x, y]

    case state
    when '.'
      return state
    when 'L'
      return '#' if adjacent_tally(x, y)['#'].zero?
    when '#'
      return 'L' if adjacent_tally(x, y)['#'] >= 4
    end

    state
  end

  def next_layout
    next_grid = grid.map.with_index do |row, i|
      row.map.with_index do |_state, j|
        next_state(j, i)
      end
    end

    Layout.new(next_grid)
  end

  def num_occupied_seats
    tally = grid.flatten.tally
    tally.default = 0

    tally['#']
  end

  def ==(other)
    return false unless other.is_a?(Layout)

    grid == other.grid
  end
end
