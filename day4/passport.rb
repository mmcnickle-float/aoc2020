# frozen_string_literal: true

class Passport
  def initialize(fields)
    @fields = fields
  end

  def valid?
    required_fields = Set[:ecl, :pid, :eyr, :hcl, :byr, :iyr, :hgt]
    supplied_fields = fields.keys.to_set

    supplied_fields.superset?(required_fields)
  end

  private

  attr_reader :fields
end
