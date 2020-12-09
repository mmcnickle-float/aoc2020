# frozen_string_literal: true

require_relative 'stream'

preamble_size = 25
file = File.open('input.txt')

stream = Stream.from_file(file, preamble_size)

puts "Invalid input: #{stream.first_invalid_number}"
