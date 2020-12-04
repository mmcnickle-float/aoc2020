# frozen_string_literal: true

module Field
  class Byr
    def initialize(year)
      @year = year
    end

    def valid?
      (1920..2002).include?(@year)
    end
  end

  class Iyr
    def initialize(year)
      @year = year
    end

    def valid?
      (2010..2020).include?(@year)
    end
  end

  class Eyr
    def initialize(year)
      @year = year
    end

    def valid?
      (2020..2030).include?(@year)
    end
  end

  class Hgt
    def initialize(height, unit)
      @height = height
      @unit = unit
    end

    def valid?
      case @unit
      when 'cm'
        (150..193).include?(@height)
      when 'in'
        (59..76).include?(@height)
      end
    end
  end

  class Hcl
    def initialize(color)
      @color = color
    end

    def valid?
      /^\#[0-9a-f]{6}$/.match?(@color)
    end
  end

  class Ecl
    def initialize(color)
      @color = color
    end

    def valid?
      valid_colors = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']
      valid_colors.include?(@color)
    end
  end

  class Pid
    def initialize(id)
      @id = id
    end

    def valid?
      /^[0-9]{9}$/.match?(@id)
    end
  end
end
