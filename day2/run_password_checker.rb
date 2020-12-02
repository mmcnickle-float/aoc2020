# frozen_string_literal: true

require 'csv'
require_relative 'parser'
require_relative 'policy'
require_relative 'position_policy'

password_lines = File.open('password_database.csv').readlines

parser = Parser.new(Policy)

parsed_lines = parser.parse_lines(password_lines)

valid_lines = parsed_lines.filter do |policy, password|
  policy.valid?(password)
end

puts "Number valid (Policy): #{valid_lines.count}"

parser = Parser.new(PositionPolicy)

parsed_lines = parser.parse_lines(password_lines)

valid_lines = parsed_lines.filter do |policy, password|
  policy.valid?(password)
end

puts "Number valid (PositionPolicy): #{valid_lines.count}"
