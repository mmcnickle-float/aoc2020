# frozen_string_literal: true

require_relative 'cpu'
require_relative 'program'

file = File.open('example_program.txt')
program = Program.from_file(file)

cpu = CPU.new

begin
  cpu.run(program.instructions)
rescue InfiniteLoopError
  puts 'Infinite loop detected'
  puts "Accumulator: #{cpu.accumulator}"
end
