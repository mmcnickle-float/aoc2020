# frozen_string_literal: true

require_relative 'cpu'

class Program
  attr_reader :instructions

  def initialize(instructions)
    @instructions = instructions
  end

  def self.from_file(file)
    instructions = file.lines.map do |instruction_text|
      Instruction.parse(instruction_text)
    end

    new(instructions)
  end
end
