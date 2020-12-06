# frozen_string_literal: true

require_relative 'declarations'
require_relative 'declarations_file'

file = File.open('declarations.txt')
declarations_file = DeclarationsFile.new(file)

counts = declarations_file.declarations.map do |declaration|
  Declarations.num_questions_everyone_answered(declaration)
end

puts "Total questions: #{counts.sum}"
