# frozen_string_literal: true

Instruction = Struct.new(:opcode, :operand) do
  def self.parse(instruction_text)
    opcode_token = instruction_text[0...1]
    operand_token = instruction_text[1..]

    opcode = opcode_token.downcase.to_sym
    operand = operand_token.to_i
    new(opcode, operand)
  end
end

class Instructions
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
