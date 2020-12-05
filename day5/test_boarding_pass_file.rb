# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'seat'
require_relative 'boarding_pass_file'

describe BoardingPassFile do
  describe '#seats' do
    it 'returns a list of seats' do
      filedata = <<~FILEDATA
        FBBFFBBLLL
        FFBFFFBRLL
        FFBBBBFRRL
      FILEDATA

      file = StringIO.new(filedata)

      boarding_pass_file = BoardingPassFile.new(file)

      expected_seats = [
        Seat.from_code('FBBFFBBLLL'),
        Seat.from_code('FFBFFFBRLL'),
        Seat.from_code('FFBBBBFRRL')
      ]

      seats = boarding_pass_file.seats

      assert_equal(expected_seats, seats)
    end
  end
end
