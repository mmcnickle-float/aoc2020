# frozen_string_literal: true

require_relative 'passport_file'

file = File.open('small_passport_file.txt')
passport_file = PassportFile.new(file)

valid_passports = passport_file.passports.filter(&:valid?)

puts "Number of valid passports: #{valid_passports.count}"
