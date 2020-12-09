# frozen_string_literal: true

require_relative 'stream'

file = File.open('example_input.txt')
stream = Stream.from_file(file, 5)

begin
  stream.validate
rescue InvalidInput => e
  puts "Invalid input: #{e.message}"
  exit
end

puts 'File valid!'
