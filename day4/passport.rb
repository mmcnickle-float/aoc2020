# frozen_string_literal: true

require 'set'

class Passport
  attr_reader :fields

  def initialize(fields)
    @fields = fields
  end

  def valid?
    required_fields = Set[:ecl, :pid, :eyr, :hcl, :byr, :iyr, :hgt]
    supplied_fields = fields.keys.to_set

    supplied_fields.superset?(required_fields)
  end

  def self.parse(data_string)
    field_pairs = data_string.split(/\s/)

    fields = field_pairs.each_with_object({}) do |field_pair, hash|
      field_name, field_value = field_pair.split(':')
      hash[field_name.to_sym] = field_value
    end

    Passport.new(fields)
  end

  def ==(other)
    fields == other.fields
  end
end
