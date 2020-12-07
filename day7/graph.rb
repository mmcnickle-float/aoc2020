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

  def add_link(parent_name, child_name)
    parent = nodes[parent_name]
    child = nodes[child_name]

    parent.add_child(child)
    child.add_parent(parent)
  end
end
