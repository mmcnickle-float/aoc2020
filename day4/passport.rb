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

      field = case name.to_sym
      when :byr
        Field::Byr.new(value.to_i)
      when :iyr
        Field::Iyr.new(value.to_i)
      when :eyr
        Field::Eyr.new(value.to_i)
      when :hgt
        pattern = /(\d*)(\w*)/
        matches = pattern.match(value)

        Field::Hgt.new(matches[1].to_i, matches[2])
      when :hcl
        Field::Hcl.new(value)
      when :ecl
        Field::Ecl.new(value)
      when :pid
        Field::Pid.new(value)
      when :cid
        Field::Cid.new(value)
      end

      hash[name.to_sym] = field
    end

    Passport.new(fields)
  end

  def ==(other)
    fields == other.fields
  end
end
