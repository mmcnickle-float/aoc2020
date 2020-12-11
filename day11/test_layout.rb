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
      layout = Layout.new(data)

      assert_equal('#', layout[0, 0])
      assert_equal('.', layout[1, 0])
      assert_equal('L', layout[9, 9])
    end
  end

  describe '#adjacent_states' do
    it 'returns the state of that position' do
      layout = Layout.new(data)

      assert_equal(['.', '#', '#'], layout.adjacent_states(0, 0))
      assert_equal(['#', '.', '#', '#', '#', '#', '.', '#'], layout.adjacent_states(1, 1))
      assert_equal(['.', '#', '#'], layout.adjacent_states(9, 9))
    end
  end
end
