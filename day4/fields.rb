# frozen_string_literal: true

module Field
  Byr = Struct.new(:year) do
    def valid?
      (1920..2002).include?(year)
    end

    def self.parse(value)
      new(value.to_i)
    end
  end

  Iyr = Struct.new(:year) do
    def valid?
      (2010..2020).include?(year)
    end

    def self.parse(value)
      new(value.to_i)
    end
  end

  Eyr = Struct.new(:year) do
    def valid?
      (2020..2030).include?(year)
    end

    def self.parse(value)
      new(value.to_i)
    end
  end

  Hgt = Struct.new(:height, :unit) do
    def valid?
      case unit
      when 'cm'
        (150..193).include?(height)
      when 'in'
        (59..76).include?(height)
      end
    end

    def self.parse(value)
      pattern = /(\d*)(\w*)/
      matches = pattern.match(value)

      new(matches[1].to_i, matches[2])
    end
  end

  Hcl = Struct.new(:color) do
    def valid?
      /^\#[0-9a-f]{6}$/.match?(color)
    end

    def self.parse(value)
      new(value)
    end
  end

  Ecl = Struct.new(:color) do
    def valid?
      valid_colors = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']
      valid_colors.include?(color)
    end

    def self.parse(value)
      new(value)
    end
  end

  Pid = Struct.new(:id) do
    def valid?
      /^[0-9]{9}$/.match?(id)
    end

    def self.parse(value)
      new(value)
    end
  end

  Cid = Struct.new(:id) do
    def valid?
      true
    end

    def self.parse(value)
      new(value)
    end
  end
end
