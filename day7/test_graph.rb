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

  describe '#add_link' do
    describe 'when there are two nodes' do
      it 'adds a link between two new nodes' do
        graph = Graph.new

        graph.add_link(:parent, :child, 1)

        assert_equal(%i[parent child], graph.nodes.keys)
        assert_equal([[graph[:child], 1]], graph[:parent].children)
        assert_equal([graph[:parent]], graph[:child].parents)
      end
    end

    describe 'when there is only one node' do
      it 'adds the node to the graph' do
        graph = Graph.new

        graph.add_link(:parent, nil, nil)

        assert_equal(%i[parent], graph.nodes.keys)
        assert_equal([], graph[:parent].children)
        assert_equal([], graph[:parent].parents)
      end
    end
  end
end
