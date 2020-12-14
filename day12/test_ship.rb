# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'ship'

describe Ship do
  let(:ship) { Ship.initial }

  describe '#n' do
    it 'moves the ship in a positive y direction' do
      ship.n(13)

      assert_equal(13, ship.position.y)
    end
  end

  describe '#s' do
    it 'moves the ship in a negative y direction' do
      ship.s(13)

      assert_equal(-13, ship.position.y)
    end
  end

  describe '#e' do
    it 'moves the ship in a positive x direction' do
      ship.e(13)

      assert_equal(13, ship.position.x)
    end
  end

  describe '#w' do
    it 'moves the ship in a negative x direction' do
      ship.w(13)

      assert_equal(-13, ship.position.x)
    end
  end

  describe '#l' do
    it 'points the ship in a new direction' do
      ship.l(90)
      assert_equal(270, ship.heading)

      ship.l(360)
      assert_equal(270, ship.heading)

      ship.l(270)
      assert_equal(0, ship.heading)
    end
  end

  describe '#r' do
    it 'points the ship in a new direction' do
      ship.r(90)
      assert_equal(90, ship.heading)

      ship.r(360)
      assert_equal(90, ship.heading)

      ship.r(270)
      assert_equal(0, ship.heading)
    end
  end

  describe '#f' do
    it 'moves the ship in the direction it is heading' do
      ship.f(13)
      assert_equal(13, ship.position.x)
      assert_equal(0, ship.position.y)

      ship.l(90)
      ship.f(13)
      assert_equal(13, ship.position.x)
      assert_equal(13, ship.position.y)

      ship.l(90)
      ship.f(13)
      assert_equal(0, ship.position.x)
      assert_equal(13, ship.position.y)

      ship.l(90)
      ship.f(13)
      assert_equal(0, ship.position.x)
      assert_equal(0, ship.position.y)
    end
  end

  describe '#manhattan_distance' do
    it 'returns the distance from its origin to its current position' do
      ship.f(10)
      ship.n(3)
      ship.f(7)
      ship.r(90)
      ship.f(11)

      assert_equal(25, ship.manhattan_distance)
    end
  end
end
