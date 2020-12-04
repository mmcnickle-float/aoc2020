# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'fields'

module Field
  describe Byr do
    describe '.valid?' do
      it 'is true between 1920 and 2002 (inclusive)' do
        assert(Byr.new(1919).valid? == false)
        assert(Byr.new(1920).valid? == true)
        assert(Byr.new(2002).valid? == true)
        assert(Byr.new(2003).valid? == false)
      end
    end
  end

  describe Iyr do
    describe '.valid?' do
      it 'is true between 2010 and 2020 (inclusive)' do
        assert(Iyr.new(2009).valid? == false)
        assert(Iyr.new(2010).valid? == true)
        assert(Iyr.new(2020).valid? == true)
        assert(Iyr.new(2021).valid? == false)
      end
    end
  end

  describe Eyr do
    describe '.valid?' do
      it 'is true between 2020 and 2030 (inclusive)' do
        assert(Eyr.new(2019).valid? == false)
        assert(Eyr.new(2020).valid? == true)
        assert(Eyr.new(2030).valid? == true)
        assert(Eyr.new(2031).valid? == false)
      end
    end
  end

  describe Hgt do
    describe '.valid?' do
      it 'is true between 2020 and 2030 (inclusive)' do
        assert(Hgt.new(149, 'cm').valid? == false)
        assert(Hgt.new(150, 'cm').valid? == true)
        assert(Hgt.new(193, 'cm').valid? == true)
        assert(Hgt.new(194, 'cm').valid? == false)

        assert(Hgt.new(58, 'in').valid? == false)
        assert(Hgt.new(59, 'in').valid? == true)
        assert(Hgt.new(76, 'in').valid? == true)
        assert(Hgt.new(77, 'in').valid? == false)
      end
    end
  end

  describe Hcl do
    describe '.valid?' do
      it 'is true if it is a hex colour' do
        assert(Hcl.new('#123abc').valid? == true)
        assert(Hcl.new('123abc').valid? == false)
        assert(Hcl.new('#123abg').valid? == false)
        assert(Hcl.new('#123ab').valid? == false)
        assert(Hcl.new('#123abcd').valid? == false)
      end
    end
  end

  describe Ecl do
    describe '.valid?' do
      it 'is true if it is a valid colour' do
        assert(Ecl.new('amb').valid? == true)
        assert(Ecl.new('blu').valid? == true)
        assert(Ecl.new('brn').valid? == true)
        assert(Ecl.new('gry').valid? == true)
        assert(Ecl.new('grn').valid? == true)
        assert(Ecl.new('hzl').valid? == true)
        assert(Ecl.new('oth').valid? == true)
        assert(Ecl.new('wat').valid? == false)
      end
    end
  end

  describe Pid do
    describe '.valid?' do
      it 'is true if it has 9 digits' do
        assert(Pid.new('000000001').valid? == true)
        assert(Pid.new('0123456789').valid? == false)
        assert(Pid.new('00000001').valid? == false)
        assert(Pid.new('00000001a').valid? == false)
      end
    end
  end
end
