# frozen_string_literal: true

require_relative 'stream'

preamble_size = 25
file = File.open('input.txt')

stream = Stream.from_file(file, preamble_size)

invalid_number = stream.first_invalid_number
sum_list = stream.contiguous_sum_list(invalid_number)

weakness = sum_list.min + sum_list.max

puts "Weakness: #{weakness}"
