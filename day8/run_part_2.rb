# frozen_string_literal: true

require_relative 'cpu'
require_relative 'program'

file = File.open('program.txt')
program = Program.from_file(file)

jmp_addresses = program.instructions.map.with_index { |instruction, index|
  index if instruction.opcode == :jmp
}.compact

jmp_addresses.each.with_index do |jmp_address, index|
  prev_address = jmp_addresses[index - 1]

  if prev_address
    program.instructions[prev_address].opcode = :jmp
  end

  cpu = CPU.new

  program.instructions[jmp_address].opcode = :nop

  begin
    cpu.run(program.instructions)
  rescue InfiniteLoopError
    puts 'Infinite loop detected'
    puts "Accumulator: #{cpu.accumulator}"
    next
  end

  puts 'Program exited normally'
  puts "Accumulator: #{cpu.accumulator}"
  exit
end
