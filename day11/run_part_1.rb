# frozen_string_literal: true

require_relative 'layout'

file = File.open('state.txt')

layout = Layout.from_string(file.read)
prev_layout = nil

iterations = 0

until layout == prev_layout
  prev_layout = layout
  layout = layout.next_layout
  iterations += 1
end

puts "Iterations: #{iterations}"
puts "Num occupied seats: #{layout.num_occupied_seats}"
