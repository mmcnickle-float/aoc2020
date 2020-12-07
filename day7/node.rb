# frozen_string_literal: true

class Node
  attr_reader :name, :children, :parents

  def initialize(name)
    @name = name
    @children = []
    @parents = []
  end

  def add_child(child, number = 1)
    children << [child, number]
  end

  def add_parent(parent)
    parents << parent
  end

  def ancestor_nodes
    return Set[] if parents.empty?

    Set[*parents] + parents.map(&:ancestor_nodes).reduce(&:+)
  end

  def count_all_children
    return 0 if children.empty?

    children.reduce(0) do |sum, child|
      sum + child[1] + (child[1] * child[0].count_all_children)
    end
  end

  def ==(other)
    name == other.name &&
      children == other.children &&
      parents == other.parents
  end
end
