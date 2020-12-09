# frozen_string_literal: true

require_relative 'stream'


preamble_size = 25
file = File.open('input.txt')

stream = Stream.from_file(file, preamble_size)

begin
  stream.validate
rescue InvalidInput => e
  puts "Invalid input: #{e.message}"
  exit
end

puts 'File valid!'
