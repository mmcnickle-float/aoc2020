# frozen_string_literal: true

require 'set'

Instruction = Struct.new(:opcode, :operand) do
  def self.parse(instruction_text)
    opcode_token, operand_token = instruction_text.split

    opcode = opcode_token.to_sym
    operand = operand_token.to_i
    new(opcode, operand)
  end
end

class InfiniteLoopError < StandardError; end

class CPU
  attr_reader :program_counter, :accumulator

  def initialize
    @program_counter = 0
    @accumulator = 0

    @addresses_visited = Set.new
  end

  def run(instructions)
    loop do
      raise InfiniteLoopError if addresses_visited.include?(program_counter)

      addresses_visited << program_counter

      instruction = instructions[program_counter]

      break if instruction.nil?

      send(instruction.opcode, instruction.operand)
    end
  end

  private

  attr_reader :addresses_visited

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
