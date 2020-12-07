# frozen_string_literal: true

require_relative 'node'

class Graph
  def initialize
    @nodes = Hash.new do |hash, key|
      hash[key] = Node.new(key)
    end
  end

  def [](node_name)
    nodes[node_name]
  end

  private

  attr_reader :nodes
end
