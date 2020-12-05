# frozen_string_literal: true

require_relative 'boarding_pass_file'

file = File.open('boarding_passes.txt')
boarding_pass_file = BoardingPassFile.new(file)

seats = boarding_pass_file.seats

seat_ids = seats.map(&:id)
all_seat_ids = (seat_ids.min..seat_ids.max).to_a

missing_seat_id = (all_seat_ids - seat_ids).first

puts "Missing seat id: #{missing_seat_id}"
