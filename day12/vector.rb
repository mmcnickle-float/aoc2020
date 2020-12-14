# frozen_string_literal: true

Vector = Struct.new(:x, :y) do
  def l90
    x2 = -y
    y2 = x

    self.x = x2
    self.y = y2
  end

  def r90
    x2 = y
    y2 = -x

    self.x = x2
    self.y = y2
  end

  def *(other)
    Vector.new(x * other, y * other)
  end

  def +(other)
    Vector.new(x + other.x, y + other.y)
  end

  def manhattan_distance
    x.abs + y.abs
  end
end
