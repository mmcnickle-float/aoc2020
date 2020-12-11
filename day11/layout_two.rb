# frozen_string_literal: true

class LayoutTwo
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

  def nearest_line_of_sight_states(x, y)
    direction_vectors = [
      [0, -1],
      [1, -1],
      [1, 0],
      [1, 1],
      [0, 1],
      [-1, 1],
      [-1, 0],
      [-1, -1]
    ]

    direction_vectors.filter_map do |direction_vector|
      state = nil
      target_vector = [x, y]

      loop do
        target_vector = [
          target_vector[0] + direction_vector[0],
          target_vector[1] + direction_vector[1]
        ]

        i, j = target_vector

        break if i.negative? || i >= width
        break if j.negative? || j >= height

        state = grid[j][i]

        break if ['#', 'L'].include?(state)
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
    LayoutTwo.from_string(to_s)
  end

  def next_state(x, y)
    state = self[x, y]

    nearest_tally = nearest_line_of_sight_states(x, y).tally
    nearest_tally.default = 0

    case state
    when '.'
      return state
    when 'L'
      return '#' if nearest_tally['#'].zero?
    when '#'
      return 'L' if nearest_tally['#'] >= 5
    end

    state
  end

  def next_layout
    next_grid = grid.map.with_index do |row, i|
      row.map.with_index do |_state, j|
        next_state(j, i)
      end
    end

    LayoutTwo.new(next_grid)
  end

  def num_occupied_seats
    tally = grid.flatten.tally
    tally.default = 0

    tally['#']
  end

  def ==(other)
    return false unless other.is_a?(LayoutTwo)

    grid == other.grid
  end
end
