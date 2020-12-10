# frozen_string_literal: true

require_relative 'adapters'

file = File.open('joltages.txt')

adapters = Adapters.from_file(file)

puts "Number of combinations: #{adapters.number_of_combinations}"
