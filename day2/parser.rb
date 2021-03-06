# frozen_string_literal: true

require_relative 'password'

class Parser
  def initialize(policy_class)
    @policy_class = policy_class
  end

  def parse_lines(lines)
    lines.map { |line| parse_line(line) }
  end

  def parse_line(line)
    line_format = /(?<at_least>\d+)-(?<at_most>\d+) (?<letter>\w): (?<password>.*)/

    parsed = line_format.match(line)

    policy = policy_class.new(
      parsed[:letter],
      parsed[:at_least].to_i,
      parsed[:at_most].to_i
    )
    password = Password.new(parsed[:password])

    [policy, password]
  end

  private

  attr_reader :policy_class
end
