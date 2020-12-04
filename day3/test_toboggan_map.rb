# frozen_string_literal: true

require 'minitest/autorun'

require_relative 'toboggan_map'

class TobogganMapTest < Minitest::Test
  def test_dimensions
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

    map = TobogganMap.new(tree_data)

    assert_equal(map.width, 11)
    assert_equal(map.height, 11)
  end

  def test_tree?
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

    map = TobogganMap.new(tree_data)

    assert(map.tree?(0, 0) == false)
    assert(map.tree?(1, 2) == true)
  end

  def test_tree_out_of_bounds_y
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

    map = TobogganMap.new(tree_data)

    map.tree?(0, 10)
    assert_raises(ArgumentError) { map.tree?(0, 11) }
    assert_raises(ArgumentError) { map.tree?(0, 12) }
  end

  def test_tree_loops_x
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

    map = TobogganMap.new(tree_data)

    assert_equal(map.tree?(0, 0), map.tree?(11, 0))
    assert_equal(map.tree?(2, 0), map.tree?(13, 0))
  end
end
