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
      case instruction.opcode
      when :acc
        acc(instruction.operand)
      when :nop
        nop(instruction.operand)
      else
        raise(ArgumentError, "opcode #{instruction.opcode} not valid")
      end
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
end
