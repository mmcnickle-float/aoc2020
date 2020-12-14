# frozen_string_literal: true

require_relative 'vector'

WaypointShip = Struct.new(:position, :waypoint) do
  def n(distance)
    waypoint.y += distance
  end

  def s(distance)
    waypoint.y -= distance
  end

  def e(distance)
    waypoint.x += distance
  end

  def w(distance)
    waypoint.x -= distance
  end

  def l(degrees)
    turns = (degrees / 90) % 4

    turns.times { waypoint.l90 }
  end

  def r(degrees)
    turns = (degrees / 90) % 4

    turns.times { waypoint.r90 }
  end

  def f(times)
    distance_vector = waypoint * times

    self.position += distance_vector
  end

  def run_instructions(instructions)
    instructions.each do |instruction|
      send(instruction.opcode, instruction.operand)
    end
  end

  def self.initial
    position = Vector.new(0, 0)
    waypoint = Vector.new(10, 1)

    new(position, waypoint)
  end
end
