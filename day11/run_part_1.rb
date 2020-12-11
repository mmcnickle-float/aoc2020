# frozen_string_literal: true

require_relative 'layout'

file = File.open('state.txt')

layout = Layout.from_string(file.read)
prev_layout = nil

until layout == prev_layout
  prev_layout = layout
  layout = layout.next_layout
end

puts "Num occupied seats: #{layout.num_occupied_seats}"
