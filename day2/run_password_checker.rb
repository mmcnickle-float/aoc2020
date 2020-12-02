# frozen_string_literal: true

require_relative 'database'
require_relative 'policy'
require_relative 'position_policy'

database = Database.new('password_database.csv')

valid_count = database.number_valid(Policy)
puts "Number valid (Policy): #{valid_count}"

valid_count = database.number_valid(PositionPolicy)
puts "Number valid (PositionPolicy): #{valid_count}"
