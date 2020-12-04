# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require 'matrix'

require_relative 'journey'
require_relative 'toboggan_map'

describe Journey do
  let(:map) do
    tree_data = <<~TREEDATA
      ..##.......
      #...#...#..
      .#....#..#.
      ..#.#...#.#
      .#...##..#.
      ..#.##.....
      .#.#.#....#
      .#........#
      #.##...#...
      #...##....#
      .#..#...#.#
    TREEDATA

    TobogganMap.new(tree_data)
  end

  describe '#count_trees' do
    it 'returns the number of trees encountered on the journey' do
      journey = Journey.new(map)
      slope = Vector[3, 1]

      assert_equal(7, journey.count_trees(slope))

      slope = Vector[4, 1]
      assert_equal(2, journey.count_trees(slope))
    end
  end
end
