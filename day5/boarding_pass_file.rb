# frozen_string_literal: true

require_relative 'seat'

class BoardingPassFile
  def initialize(file)
    @file = file
  end

  def seats
    seat_codes = file.read.split(/\n/)
    seat_codes.map { |seat_code| Seat.from_code(seat_code) }
  end

  private

  attr_reader :file
end
