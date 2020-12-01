# frozen_string_literal: true

require 'benchmark'
require 'csv'
require_relative 'expense_account'

raw_input = CSV.read('expense_account.csv', converters: :numeric)

input = raw_input.map { |row| row[0] }

puts expense_account(input)
puts expense_account_set(input)
puts expense_account_hash(input)
puts expense_account_three(input)
puts expense_account_three_hash(input)
# puts expense_account_four(input)
# puts expense_account_four_hash(input)

n = 10

Benchmark.bm do |x|
  x.report('2 naive') { n.times { expense_account(input) } }
  x.report('2 Set  ') { n.times { expense_account_set(input) } }
  x.report('2 Hash ') { n.times { expense_account_hash(input) } }
  x.report('3 naive') { n.times { expense_account_three(input) } }
  x.report('3 Hash ') { n.times { expense_account_three_hash(input) } }
#  x.report('4 naive ') { n.times { expense_account_four(input) } }
#  x.report('4 Hash') { n.times { expense_account_four_hash(input) } }
end
