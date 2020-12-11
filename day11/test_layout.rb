# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'layout'

describe Layout do
  let(:data) do
    <<~DATA
      #.##.##.##
      #######.##
      #.#.#..#..
      ####.##.##
      #.##.##.##
      #.#####.##
      ..#.#.....
      ##########
      #.######.#
      #.#####.#L
    DATA
  end

  describe '#[]' do
    it 'returns the state of that position' do
      layout = Layout.from_string(data)

      assert_equal('#', layout[0, 0])
      assert_equal('.', layout[1, 0])
      assert_equal('L', layout[9, 9])
    end
  end

  describe 'to_s' do
    it 'returns a string representation of the layout' do
      layout = Layout.from_string(data)

      assert_equal(data.chomp, layout.to_s)
    end
  end

  describe '#[]=' do
    it 'modifies the state of that position' do
      layout = Layout.from_string(data)
      layout[0, 0] = 'L'

      assert_equal('L', layout[0, 0])
    end
  end

  describe '#adjacent_states' do
    it 'returns the state of that position' do
      layout = Layout.from_string(data)

      assert_equal(['.', '#', '#'], layout.adjacent_states(0, 0))
      assert_equal(['#', '.', '#', '#', '#', '#', '.', '#'], layout.adjacent_states(1, 1))
      assert_equal(['.', '#', '#'], layout.adjacent_states(9, 9))
    end
  end

  describe '#copy' do
    it 'returns a deep copy of the layout' do
      layout = Layout.from_string(data)
      layout_copy = layout.copy

      layout[0, 0] = 'L'

      assert(layout[0, 0] != layout_copy[0, 0])
    end
  end
end
