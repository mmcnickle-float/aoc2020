# frozen_string_literal: true

require_relative 'layout_two'

file = File.open('state.txt')

layout = LayoutTwo.from_string(file.read)
prev_layout = nil

iterations = 0

until layout == prev_layout
  puts "Iterations: #{iterations}"
  prev_layout = layout
  layout = layout.next_layout
  iterations += 1
end

puts "Num occupied seats: #{layout.num_occupied_seats}"
