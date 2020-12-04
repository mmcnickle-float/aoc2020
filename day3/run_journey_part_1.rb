# frozen_string_literal: true

require 'matrix'

require_relative 'toboggan_map'
require_relative 'journey'

tree_data = File.read('map.txt')
map = TobogganMap.new(tree_data)

journey = Journey.new(map)
slope = Vector[3, 1]

number_of_trees = journey.count_trees(slope)

puts "Number of trees: #{number_of_trees}"
