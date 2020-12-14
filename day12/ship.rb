# frozen_string_literal: true

Ship = Struct.new(:x, :y) do
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
end
