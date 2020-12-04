# frozen_string_literal: true

require 'set'

require_relative 'fields'

class Passport
  attr_reader :fields

  def initialize(fields)
    @fields = fields
  end

  def valid?
    required_fields = Set[:ecl, :pid, :eyr, :hcl, :byr, :iyr, :hgt]
    supplied_fields = fields.keys.to_set

    return false unless supplied_fields.superset?(required_fields)

    fields.values.all?(&:valid?)
  end

  def self.parse(data_string)
    field_pairs = data_string.split(/\s/)

    fields = field_pairs.each_with_object({}) do |field_pair, hash|
      name, value = field_pair.split(':')

      field_classname = "Field::#{name.capitalize}"
      field_class = Kernel.const_get(field_classname)

      hash[name.to_sym] = field_class.parse(value)
    end

    Passport.new(fields)
  end

  def ==(other)
    fields == other.fields
  end
end
