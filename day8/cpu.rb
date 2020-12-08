# frozen_string_literal: true

Instruction = Struct.new(:opcode, :operand)

class CPU
  attr_reader :program_counter, :accumulator

  def initialize
    @program_counter = 0
    @accumulator = 0
  end

  def run(instructions)
    instructions.each do |instruction|
      send(instruction.opcode, instruction.operand)
    end
  end

  private

  def acc(operand)
    @accumulator += operand
    @program_counter += 1
  end

  def nop(_operand)
    @program_counter += 1
  end

  def jmp(operand)
    @program_counter += operand
  end
end
