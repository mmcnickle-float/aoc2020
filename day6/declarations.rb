# frozen_string_literal: true

require 'set'

module Declarations
  def self.num_questions_answered(group_declaration)
    Set[*group_declaration.join.chars].count
  end
end
