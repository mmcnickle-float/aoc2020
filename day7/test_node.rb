# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'graph'

describe Node do
  describe '#add_child' do
    it 'adds a child to the node' do
      parent = Node.new(:parent)
      child = Node.new(:child)

      parent.add_child(child)

      assert_equal([child], parent.children)
    end
  end

  describe '#add_parent' do
    it 'adds a parent to the node' do
      parent = Node.new(:parent)
      child = Node.new(:child)

      child.add_parent(parent)

      assert_equal([parent], child.parents)
    end
  end

  describe '#ancestor_nodes' do
    it 'returns a set of all its ancestor nodes' do
      greatgrandparent = Node.new(:greatgrandparent)

      grandparent1 = Node.new(:grandparent1)
      grandparent2 = Node.new(:grandparent2)

      parent1 = Node.new(:parent2)
      parent2 = Node.new(:parent2)

      child = Node.new(:child)

      grandparent1.add_parent(greatgrandparent)
      grandparent2.add_parent(greatgrandparent)

      parent1.add_parent(grandparent1)
      parent1.add_parent(grandparent2)

      child.add_parent(parent1)
      child.add_parent(parent2)

      expected_ancestor_nodes = Set[
        parent1, parent2, grandparent1, grandparent2, greatgrandparent
      ]

      assert_equal(expected_ancestor_nodes, child.ancestor_nodes)
    end
  end
end
