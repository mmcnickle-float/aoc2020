# frozen_string_literal: true

require_relative 'node'

class Graph
  attr_reader :nodes

  def initialize
    @nodes = Hash.new do |hash, key|
      hash[key] = Node.new(key)
    end
  end

  def [](node_name)
    nodes[node_name]
  end

  def add_link(parent_name, child_name, number)
    parent = nodes[parent_name]

    return unless child_name

    child = nodes[child_name]

    parent.add_child(child, number)
    child.add_parent(parent)
  end

  def self.from_file(file)
    file.lines.each_with_object(Graph.new) do |rule_text, graph|
      rule = Rule.parse(rule_text)

      rule.links.each do |link|
        graph.add_link(*link)
      end
    end
  end
end
