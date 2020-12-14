# frozen_string_literal: true

require_relative 'instructions'
require_relative 'ship'

file = File.open('nav_instructions.txt')

instructions = Instructions.from_file(file)
ship = Ship.initial

ship.run_instructions(instructions.instructions)

puts "Position: #{ship.x}, #{ship.y}"
puts "Distance: #{ship.manhattan_distance}"
