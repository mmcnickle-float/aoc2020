# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'ship'

describe Ship do
  describe '#n' do
    it 'moves the ship in a positive y direction' do
      ship = Ship.new(0, 0)

      ship.n(13)

      assert_equal(13, ship.y)
    end
  end

  describe '#s' do
    it 'moves the ship in a negative y direction' do
      ship = Ship.new(0, 0)

      ship.s(13)

      assert_equal(-13, ship.y)
    end
  end

  describe '#e' do
    it 'moves the ship in a positive x direction' do
      ship = Ship.new(0, 0)

      ship.e(13)

      assert_equal(13, ship.x)
    end
  end

  describe '#1' do
    it 'moves the ship in a negative x direction' do
      ship = Ship.new(0, 0)

      ship.w(13)

      assert_equal(-13, ship.x)
    end
  end
end
