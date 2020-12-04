# frozen_string_literal: true

require_relative 'passport'

class PassportFile
  def initialize(file)
    @file = file
  end

  def passports
    passport_data_strings = file.read.split(/\n\n/)

    passport_data_strings.map do |data_string|
      Passport.parse(data_string)
    end
  end

  private

  attr_reader :file
end
