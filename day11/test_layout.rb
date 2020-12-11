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

  let(:layout) { Layout.from_string(data) }

  describe '#[]' do
    it 'returns the state of that position' do
      assert_equal('#', layout[0, 0])
      assert_equal('.', layout[1, 0])
      assert_equal('L', layout[9, 9])
    end
  end

  describe 'to_s' do
    it 'returns a string representation of the layout' do
      assert_equal(data, layout.to_s)
    end
  end

  describe '#[]=' do
    it 'modifies the state of that position' do
      layout[0, 0] = 'L'

      assert_equal('L', layout[0, 0])
    end
  end

  describe '#adjacent_states' do
    it 'returns the state of that position' do
      assert_equal(['.', '#', '#'], layout.adjacent_states(0, 0))
      assert_equal(['#', '.', '#', '#', '#', '#', '.', '#'], layout.adjacent_states(1, 1))
      assert_equal(['.', '#', '#'], layout.adjacent_states(9, 9))
    end
  end

  describe '#copy' do
    it 'returns a deep copy of the layout' do
      layout_copy = layout.copy

      layout[0, 0] = 'L'

      assert(layout[0, 0] != layout_copy[0, 0])
    end
  end

  describe '#next_state' do
    let(:data) do
      <<~DATA
        L.LL.LL.LL
        LLLLLLL.LL
        L.L.L..L..
        L.#L.LL.#L
        L###LLL.##
        L.#.L..#..
      DATA
    end

    it 'returns the next state of the position' do
      assert_equal('#', layout.next_state(0, 0))
      assert_equal('.', layout.next_state(1, 0))
      assert_equal('L', layout.next_state(2, 4))
      assert_equal('#', layout.next_state(8, 4))
    end
  end

  describe '#==' do
    it 'return true if the grids are the same' do
      assert_equal(Layout.from_string(data), Layout.from_string(data))
    end

    it 'returns false if the grids are different' do
      different_data = <<~DATA
        #.##.##.##
        #######.##
        #.#.#..#..
        ####.##.##
        #.##.##.##
        #.#####.##
        ..#.#.....
        ##########
        #.######.#
        #.#####.##
      DATA

      assert(Layout.from_string(different_data) != Layout.from_string(data))
    end
  end

  describe '#next_layout' do
    let(:data) do
      <<~DATA
        L.LL.LL.LL
        LLLLLLL.LL
        L.L.L..L..
        LLLL.LL.LL
        L.LL.LL.LL
        L.LLLLL.LL
        ..L.L.....
        LLLLLLLLLL
        L.LLLLLL.L
        L.LLLLL.LL
      DATA
    end

    it 'returns the next state of the whole layout' do
      next_data = <<~NEXTDATA
        #.##.##.##
        #######.##
        #.#.#..#..
        ####.##.##
        #.##.##.##
        #.#####.##
        ..#.#.....
        ##########
        #.######.#
        #.#####.##
      NEXTDATA
      next_layout = layout.next_layout

      assert_equal(next_data, next_layout.to_s)

      next_data2 = <<~NEXTDATA
        #.LL.L#.##
        #LLLLLL.L#
        L.L.L..L..
        #LLL.LL.L#
        #.LL.LL.LL
        #.LLLL#.##
        ..L.L.....
        #LLLLLLLL#
        #.LLLLLL.L
        #.#LLLL.##
      NEXTDATA
      next_layout2 = next_layout.next_layout

      assert_equal(next_data2, next_layout2.to_s)

      next_data3 = <<~NEXTDATA
        #.##.L#.##
        #L###LL.L#
        L.#.#..#..
        #L##.##.L#
        #.##.LL.LL
        #.###L#.##
        ..#.#.....
        #L######L#
        #.LL###L.L
        #.#L###.##
      NEXTDATA
      next_layout3 = next_layout2.next_layout

      assert_equal(next_data3, next_layout3.to_s)
    end
  end
end
