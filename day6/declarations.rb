# frozen_string_literal: true

require 'set'

module Declarations
  def self.num_questions_answered(group_declaration)
    Set[*group_declaration.join.chars].count
  end

  def self.num_questions_everyone_answered(group_declaration)
    questions_sets = group_declaration.map do |declaration|
      Set[*declaration.chars]
    end

    questions_sets.reduce(:&).count
  end
end
