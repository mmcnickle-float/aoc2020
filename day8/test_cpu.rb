# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'cpu'

describe CPU do
  describe '.new' do
    it 'sets the CPU in a default state' do
      cpu = CPU.new

      assert_equal(0, cpu.program_counter)
      assert_equal(0, cpu.accumulator)
    end
  end

  describe 'nop' do
    it 'advances the program counter by 1' do
      cpu = CPU.new

      instructions = [
        Instruction.new(:nop, 1)
      ]

      cpu.run(instructions)

      assert_equal(1, cpu.program_counter)
      assert_equal(0, cpu.accumulator)
    end

    it 'advances the program counter by 1 each instruction' do
      cpu = CPU.new

      instructions = [
        Instruction.new(:nop, 1),
        Instruction.new(:nop, 10),
        Instruction.new(:nop, -1)
      ]

      cpu.run(instructions)

      assert_equal(3, cpu.program_counter)
      assert_equal(0, cpu.accumulator)
    end
  end

  describe 'acc' do
    it 'increases the accumulator by a given value' do
      cpu = CPU.new

      instructions = [
        Instruction.new(:acc, 1)
      ]

      cpu.run(instructions)

      assert_equal(1, cpu.accumulator)
    end

    it 'decreases the accumulator by a given value' do
      cpu = CPU.new

      instructions = [
        Instruction.new(:acc, -9)
      ]

      cpu.run(instructions)

      assert_equal(-9, cpu.accumulator)
    end
  end

  describe 'jmp' do
    it 'increases the program counter by a given value' do
      cpu = CPU.new

      instructions = [
        Instruction.new(:jmp, 3)
      ]

      cpu.run(instructions)

      assert_equal(3, cpu.program_counter)
    end

    it 'does not execute instructions between the jumps' do
      cpu = CPU.new

      instructions = [
        Instruction.new(:jmp, 2),
        Instruction.new(:acc, 10),
        Instruction.new(:nop, 0)
      ]

      cpu.run(instructions)

      assert_equal(0, cpu.accumulator)
      assert_equal(3, cpu.program_counter)
    end

    it 'decreases the program counter by a given value' do
      cpu = CPU.new

      instructions = [
        Instruction.new(:jmp, -3)
      ]

      cpu.run(instructions)

      assert_equal(-3, cpu.program_counter)
    end
  end

  describe '#run' do
    it 'halts execution before an instruction would be called twice' do
      cpu = CPU.new

      instructions = [
        Instruction.new(:nop, 1),
        Instruction.new(:jmp, -1)
      ]

      assert_raises(InfiniteLoopError) { cpu.run(instructions) }
    end

    it 'halts execution before an instruction would be called twice' do
      cpu = CPU.new

      instructions = [
        Instruction.new(:nop, 0),
        Instruction.new(:acc, 1),
        Instruction.new(:jmp, 4),
        Instruction.new(:acc, 3),
        Instruction.new(:jmp, -3),
        Instruction.new(:acc, -99),
        Instruction.new(:acc, 1),
        Instruction.new(:jmp, -4),
        Instruction.new(:acc, 6)
      ]

      begin
        cpu.run(instructions)
      rescue InfiniteLoopError
      end

      assert_equal(5, cpu.accumulator)
    end
  end
end

describe Instruction do
  describe '.parse' do
    it 'can parse an instrction' do
      instruction = Instruction.parse('nop +0')
      expected_instruction = Instruction.new(:nop, 0)
      assert_equal(expected_instruction, instruction)

      instruction = Instruction.parse('nop -0')
      expected_instruction = Instruction.new(:nop, 0)
      assert_equal(expected_instruction, instruction)

      instruction = Instruction.parse('nop -1')
      expected_instruction = Instruction.new(:nop, -1)
      assert_equal(expected_instruction, instruction)

      instruction = Instruction.parse('nop +1')
      expected_instruction = Instruction.new(:nop, 1)
      assert_equal(expected_instruction, instruction)

      instruction = Instruction.parse('jmp +1')
      expected_instruction = Instruction.new(:jmp, 1)
      assert_equal(expected_instruction, instruction)

      instruction = Instruction.parse('acc +10')
      expected_instruction = Instruction.new(:acc, 10)
      assert_equal(expected_instruction, instruction)
    end
  end
end
