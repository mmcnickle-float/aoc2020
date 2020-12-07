# frozen_string_literal: true

require_relative 'graph'
require_relative 'rule'

file = File.open('rules.txt')

graph = Graph.new

file.lines.each do |rule_text|
  rule = Rule.parse(rule_text)

  rule.links.each do |link|
    graph.add_link(*link)
  end
end

ancestor_names = graph[:shiny_gold].ancestor_nodes.map(&:name)

puts "Number of bags: #{ancestor_names.count}"
