# frozen_string_literal: true

require 'csv'
require_relative 'parser'

password_lines = File.open('password_database.csv').readlines

parser = Parser.new

parsed_lines = parser.parse_lines(password_lines)

valid_lines = parsed_lines.filter do |policy, password|
  password.valid?(policy)
end

puts valid_lines[2]

puts valid_lines.count