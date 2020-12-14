# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'vector'
require_relative 'waypoint_ship'

describe WaypointShip do
  let(:ship) do
    position = Vector.new(0, 0)
    waypoint = Vector.new(0, 0)

    WaypointShip.new(position, waypoint)
  end

  describe '#n' do
    it 'moves the waypoint in a positive y direction' do
      ship.n(13)

      assert_equal(13, ship.waypoint.y)
    end
  end

  describe '#s' do
    it 'moves the waypoint in a negative y direction' do
      ship.s(13)

      assert_equal(-13, ship.waypoint.y)
    end
  end

  describe '#e' do
    it 'moves the waypoint in a positive x direction' do
      ship.e(13)

      assert_equal(13, ship.waypoint.x)
    end
  end

  describe '#w' do
    it 'moves the waypoint in a negative x direction' do
      ship.w(13)

      assert_equal(-13, ship.waypoint.x)
    end
  end

  describe '#l' do
    it 'rotates the waypoint anticlockwise by given degrees' do
      position = Vector.new(0, 0)
      waypoint = Vector.new(5, 5)
      ship = WaypointShip.new(position, waypoint)

      ship.l(90)
      expected_waypoint = Vector.new(-5, 5)
      assert_equal(expected_waypoint, ship.waypoint)

      ship.l(360)
      assert_equal(expected_waypoint, ship.waypoint)

      ship.l(270)
      expected_waypoint = Vector.new(5, 5)
      assert_equal(expected_waypoint, ship.waypoint)
    end
  end

  describe '#r' do
    it 'rotates the waypoint clockwise by given degrees' do
      position = Vector.new(0, 0)
      waypoint = Vector.new(5, 5)
      ship = WaypointShip.new(position, waypoint)

      ship.r(90)
      expected_waypoint = Vector.new(5, -5)
      assert_equal(expected_waypoint, ship.waypoint)

      ship.r(360)
      assert_equal(expected_waypoint, ship.waypoint)

      ship.r(270)
      expected_waypoint = Vector.new(5, 5)
      assert_equal(expected_waypoint, ship.waypoint)
    end
  end

  describe '#f' do
    it 'moves the ship towards the waypoint n times' do
      ship = WaypointShip.initial

      ship.f(10)

      assert_equal(100, ship.position.x)
      assert_equal(10, ship.position.y)
    end
  end
end
