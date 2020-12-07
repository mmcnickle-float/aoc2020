# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'graph'

describe Graph do
  it 'returns an empty node if the node doesn\' exist' do
    graph = Graph.new

    node = graph[:new_node]
    expected_node = Node.new(:new_node)

    assert_equal(expected_node, node)
  end

  it 'returns the existing node if it exists' do
    graph = Graph.new

    assert_same(graph[:test_node], graph[:test_node])
  end
end
