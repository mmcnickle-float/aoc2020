# frozen_string_literal: true

require 'matrix'

require_relative 'toboggan_map'
require_relative 'journey'

tree_data = File.read('map.txt')
map = TobogganMap.new(tree_data)
journey = Journey.new(map)

slopes = [
  Vector[1, 1],
  Vector[3, 1],
  Vector[5, 1],
  Vector[7, 1],
  Vector[1, 2]
]

tree_counts = slopes.map { |slope| journey.count_trees(slope) }

product = tree_counts.inject(:*)

puts "Total product of trees: #{product}"
