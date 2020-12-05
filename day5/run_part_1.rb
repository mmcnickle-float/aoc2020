# frozen_string_literal: true

require_relative 'boarding_pass_file'

file = File.open('boarding_passes.txt')
boarding_pass_file = BoardingPassFile.new(file)

seats = boarding_pass_file.seats

seat_ids = seats.map(&:id)

puts "Highest seat id: #{seat_ids.max}"
