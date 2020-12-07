# frozen_string_literal: true

class Node
  attr_reader :name, :children, :parents

  def initialize(name)
    @name = name
    @children = []
    @parents = []
  end

  def add_child(child)
    children << child
  end

  def add_parent(parent)
    parents << parent
  end

  def ==(other)
    name == other.name &&
      children = other.children &&
      parents = other.parents
  end
end
