# frozen_string_literal: true

class Password
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def ==(other)
    value == other.value
  end

  def to_s
    "<Password value:#{value}>"
  end
end
