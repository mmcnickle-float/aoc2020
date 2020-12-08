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

    it 'decreases the program counter by a given value' do
      cpu = CPU.new

      instructions = [
        Instruction.new(:jmp, -3)
      ]

      cpu.run(instructions)

      assert_equal(-3, cpu.program_counter)
    end
  end
end
