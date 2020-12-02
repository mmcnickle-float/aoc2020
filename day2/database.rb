# frozen_string_literal: true

require_relative 'parser'

class Database
  def initialize(filename)
    @filename = filename
  end

  def password_lines
    File.open(filename).readlines
  end

  def number_valid(policy_class)
    parser = Parser.new(policy_class)

    parsed_lines = parser.parse_lines(password_lines)

    valid_lines = parsed_lines.filter do |policy, password|
      policy.valid?(password)
    end

    valid_lines.count
  end

  private

  attr_reader :filename
end
