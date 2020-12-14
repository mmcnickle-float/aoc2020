# frozen_string_literal: true

require_relative 'instructions'
require_relative 'waypoint_ship'

file = File.open('nav_instructions.txt')

instructions = Instructions.from_file(file)
ship = WaypointShip.initial

ship.run_instructions(instructions.instructions)

puts "Position: #{ship.position}"
puts "Distance: #{ship.position.manhattan_distance}"
