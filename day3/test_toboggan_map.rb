# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'toboggan_map'

describe TobogganMap do
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

  describe '#width' do
    it 'returns the width of the map' do
      assert_equal(map.width, 11)
    end
  end

  describe '#height' do
    it 'returns the height of the map' do
      assert_equal(map.height, 11)
    end
  end

  describe '#tree' do
    it 'returns if a tree exists at the coordinates' do
      assert(map.tree?(0, 0) == false)
      assert(map.tree?(1, 2) == true)
    end

    describe 'when y is out of bounds' do
      it 'raises an ArgumentError' do
        map.tree?(0, 10)
        assert_raises(ArgumentError) { map.tree?(0, 11) }
        assert_raises(ArgumentError) { map.tree?(0, 12) }
      end
    end

    describe 'when x is out of bounds' do
      it 'loops around in the x direction' do
        assert_equal(map.tree?(0, 0), map.tree?(11, 0))
        assert_equal(map.tree?(2, 0), map.tree?(13, 0))
      end
    end
  end
end
