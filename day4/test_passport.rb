# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'passport'
require_relative 'fields'

describe Passport do
  describe '#valid?' do
    describe 'when all the required fields are present' do
      it 'returns true' do
        passport_fields = {
          ecl: Field::Ecl.new('gry'),
          pid: Field::Pid.new('860033327'),
          eyr: Field::Eyr.new(2020),
          hcl: Field::Hcl.new('#fffffd'),
          byr: Field::Byr.new(1937),
          iyr: Field::Iyr.new(2017),
          cid: Field::Cid.new('147'),
          hgt: Field::Hgt.new(183, 'cm')
        }

        passport = Passport.new(passport_fields)

        assert(passport.valid?)
      end
    end

    describe 'when some required fields are missing' do
      it 'returns false' do
        passport_fields = {
          ecl: Field::Ecl.new('gry'),
          pid: Field::Pid.new('860033327'),
          eyr: Field::Eyr.new(2020),
          hcl: Field::Hcl.new('#fffffd'),
          byr: Field::Byr.new(1937),
          iyr: Field::Iyr.new(2017),
          cid: Field::Cid.new('147')
        }

        passport = Passport.new(passport_fields)

        assert(passport.valid? == false)
      end
    end

    describe 'when the county id is missing' do
      it 'returns true' do
        passport_fields = {
          ecl: Field::Ecl.new('gry'),
          pid: Field::Pid.new('860033327'),
          eyr: Field::Eyr.new(2020),
          hcl: Field::Hcl.new('#fffffd'),
          byr: Field::Byr.new(1937),
          iyr: Field::Iyr.new(2017),
          hgt: Field::Hgt.new(183, 'cm')
        }

        passport = Passport.new(passport_fields)

        assert(passport.valid?)
      end
    end

    describe 'when the county id and other fields are missing' do
      it 'returns true' do
        passport_fields = {
          ecl: Field::Ecl.new('gry'),
          pid: Field::Pid.new('860033327'),
          eyr: Field::Eyr.new(2020),
          hcl: Field::Hcl.new('#fffffd'),
          byr: Field::Byr.new(1937),
          iyr: Field::Iyr.new(2017)
        }

        passport = Passport.new(passport_fields)

        assert(passport.valid? == false)
      end
    end

    describe 'when some of the fields are invalid' do
      it 'returns false' do
        data_string = <<~PASSPORT_DATA
          eyr:1972 cid:100
          hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926
        PASSPORT_DATA
        passport = Passport.parse(data_string)
        assert(passport.valid? == false)

        data_string = <<~PASSPORT_DATA
          iyr:2019
          hcl:#602927 eyr:1967 hgt:170cm
          ecl:grn pid:012533040 byr:1946
        PASSPORT_DATA
        passport = Passport.parse(data_string)
        assert(passport.valid? == false)

        data_string = <<~PASSPORT_DATA
          hcl:dab227 iyr:2012
          ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277
        PASSPORT_DATA
        passport = Passport.parse(data_string)
        assert(passport.valid? == false)

        data_string = <<~PASSPORT_DATA
          hgt:59cm ecl:zzz
          eyr:2038 hcl:74454a iyr:2023
          pid:3556412378 byr:2007
        PASSPORT_DATA
        passport = Passport.parse(data_string)
        assert(passport.valid? == false)
      end

      it 'returns true' do
        data_string = <<~PASSPORT_DATA
          pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
          hcl:#623a2f
        PASSPORT_DATA
        passport = Passport.parse(data_string)
        assert(passport.valid? == true)

        data_string = <<~PASSPORT_DATA
          eyr:2029 ecl:blu cid:129 byr:1989
          iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm
        PASSPORT_DATA
        passport = Passport.parse(data_string)
        assert(passport.valid? == true)

        data_string = <<~PASSPORT_DATA
          hcl:#888785
          hgt:164cm byr:2001 iyr:2015 cid:88
          pid:545766238 ecl:hzl
          eyr:2022
        PASSPORT_DATA
        passport = Passport.parse(data_string)
        assert(passport.valid? == true)

        data_string = <<~PASSPORT_DATA
          iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719
        PASSPORT_DATA
        passport = Passport.parse(data_string)
        assert(passport.valid? == true)
      end
    end
  end

  describe '.parse' do
    it 'returns a instantiated passport' do
      data_string = <<~PASSPORT_DATA
        ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
        byr:1937 iyr:2017 cid:147 hgt:183cm
      PASSPORT_DATA

      passport = Passport.parse(data_string)

      expected_passport = Passport.new(
        {
          ecl: Field::Ecl.new('gry'),
          pid: Field::Pid.new('860033327'),
          eyr: Field::Eyr.new(2020),
          hcl: Field::Hcl.new('#fffffd'),
          byr: Field::Byr.new(1937),
          iyr: Field::Iyr.new(2017),
          cid: Field::Cid.new('147'),
          hgt: Field::Hgt.new(183, 'cm')
        }
      )

      assert_equal(expected_passport, passport)
    end

    it 'returns a instantiated passport' do
      data_string = <<~PASSPORT_DATA
        iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
        hcl:#cfa07d byr:1929
      PASSPORT_DATA

      passport = Passport.parse(data_string)

      expected_passport = Passport.new(
        {
          ecl: Field::Ecl.new('amb'),
          pid: Field::Pid.new('028048884'),
          eyr: Field::Eyr.new(2023),
          hcl: Field::Hcl.new('#cfa07d'),
          byr: Field::Byr.new(1929),
          iyr: Field::Iyr.new(2013),
          cid: Field::Cid.new('350')
        }
      )

      assert_equal(expected_passport, passport)
    end

    it 'returns a instantiated passport' do
      data_string = <<~PASSPORT_DATA
        hcl:#ae17e1 iyr:2013
        eyr:2024
        ecl:brn pid:760753108 byr:1931
        hgt:179cm
      PASSPORT_DATA

      passport = Passport.parse(data_string)

      expected_passport = Passport.new(
        {
          ecl: Field::Ecl.new('brn'),
          pid: Field::Pid.new('760753108'),
          eyr: Field::Eyr.new(2024),
          hcl: Field::Hcl.new('#ae17e1'),
          byr: Field::Byr.new(1931),
          iyr: Field::Iyr.new(2013),
          hgt: Field::Hgt.new(179, 'cm')
        }
      )

      assert_equal(expected_passport, passport)
    end

    it 'returns a instantiated passport' do
      data_string = <<~PASSPORT_DATA
        hcl:#cfa07d eyr:2025 pid:166559648
        iyr:2011 ecl:brn hgt:59in
      PASSPORT_DATA

      passport = Passport.parse(data_string)

      expected_passport = Passport.new(
        {
          ecl: Field::Ecl.new('brn'),
          pid: Field::Pid.new('166559648'),
          eyr: Field::Eyr.new(2025),
          hcl: Field::Hcl.new('#cfa07d'),
          iyr: Field::Iyr.new(2011),
          hgt: Field::Hgt.new(59, 'in')
        }
      )

      assert_equal(expected_passport, passport)
    end
  end
end
