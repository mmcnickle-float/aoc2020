# frozen_string_literal: true

Ship = Struct.new(:x, :y, :heading) do
  def n(distance)
    self.y += distance
  end

  def s(distance)
    self.y -= distance
  end

  def e(distance)
    self.x += distance
  end

  def w(distance)
    self.x -= distance
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
    x.abs + y.abs
  end

  def self.initial
    new(0, 0, 0)
  end
end
