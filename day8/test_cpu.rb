# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'cpu'

describe CPU do
  describe '.new' do
    it 'sets the CPU in a default state' do
      cpu = CPU.new

      assert_equal(0, cpu.program_counter)
    end
  end

  describe 'nop' do
    it 'advances the program counter by 1' do
      cpu = CPU.new

      instructions = [
        Instruction.new('nop', 1)
      ]

      cpu.run(instructions)

      assert_equal(1, cpu.program_counter)
    end

    it 'advances the program counter by 1 each instruction' do
      cpu = CPU.new

      instructions = [
        Instruction.new('nop', 1),
        Instruction.new('nop', 10),
        Instruction.new('nop', -1)
      ]

      cpu.run(instructions)

      assert_equal(3, cpu.program_counter)
    end
  end
end
