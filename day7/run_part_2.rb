# frozen_string_literal: true

require_relative 'graph'
require_relative 'rule'

file = File.open('rules.txt')
graph = Graph.from_file(file)

puts "Number of bags: #{graph[:shiny_gold].count_all_children}"
