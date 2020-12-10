# frozen_string_literal: true

require_relative 'adapters'

file = File.open('joltages.txt')

adapters = Adapters.from_file(file)

distribution = adapters.joltage_distribution
product = distribution[1] * distribution[3]

puts distribution.inspect
puts "Distribution product: #{product}"
