# frozen_string_literal: true

Instruction = Struct.new(:opcode, :operand)

class CPU
  attr_reader :program_counter

  def initialize()
    @program_counter = 0
  end

  def run(instructions)
    instructions.each do |instruction|
      @program_counter += 1
    end
  end
end
