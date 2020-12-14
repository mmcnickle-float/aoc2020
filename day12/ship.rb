# frozen_string_literal: true

require_relative 'vector'

Ship = Struct.new(:position, :heading) do
  def n(distance)
    position.y += distance
  end

  def s(distance)
    position.y -= distance
  end

  def e(distance)
    position.x += distance
  end

  def w(distance)
    position.x -= distance
  end

  def f(distance)
    send(direction, distance)
  end

  def l(degrees)
    self.heading = (heading - degrees) % 360
  end

  def r(degrees)
    self.heading = (heading + degrees) % 360
  end

  def run_instructions(instructions)
    instructions.each do |instruction|
      send(instruction.opcode, instruction.operand)
    end
  end

  def direction
    heading_to_direction = {
      0 => :e,
      90 => :s,
      180 => :w,
      270 => :n
    }

    heading_to_direction[heading]
  end

  def manhattan_distance
    position.manhattan_distance
  end

  def self.initial
    new(Vector.new(0, 0), 0)
  end
end
