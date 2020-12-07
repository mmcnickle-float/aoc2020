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
end
