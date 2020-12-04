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
          ecl: 'gry',
          pid: '860033327',
          eyr: '2020',
          hcl: '#fffffd',
          byr: '1937',
          iyr: '2017',
          cid: '147',
          hgt: '183cm'
        }

        passport = Passport.new(passport_fields)

        assert(passport.valid?)
      end
    end

    describe 'when some required fields are missing' do
      it 'returns false' do
        passport_fields = {
          ecl: 'gry',
          pid: '860033327',
          eyr: '2020',
          hcl: '#fffffd',
          byr: '1937',
          iyr: '2017',
          cid: '147'
        }

        passport = Passport.new(passport_fields)

        assert(passport.valid? == false)
      end
    end

    describe 'when the county id is missing' do
      it 'returns true' do
        passport_fields = {
          ecl: 'gry',
          pid: '860033327',
          eyr: '2020',
          hcl: '#fffffd',
          byr: '1937',
          iyr: '2017',
          hgt: '183cm'
        }

        passport = Passport.new(passport_fields)

        assert(passport.valid?)
      end
    end

    describe 'when the county id and other fields are missing' do
      it 'returns true' do
        passport_fields = {
          ecl: 'gry',
          pid: '860033327',
          eyr: '2020',
          hcl: '#fffffd',
          iyr: '2017',
          hgt: '183cm'
        }

        passport = Passport.new(passport_fields)

        assert(passport.valid? == false)
      end
    end

    describe 'when some of the fields are invalid' do
      it 'returns true' do
        data_string = <<~PASSPORT_DATA
          eyr:1972 cid:100
          hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926
        PASSPORT_DATA

        passport = Passport.parse(data_string)

        assert(passport.valid? == false)
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
          ecl: 'gry',
          pid: '860033327',
          eyr: '2020',
          hcl: '#fffffd',
          byr: '1937',
          iyr: '2017',
          cid: '147',
          hgt: '183cm'
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
          ecl: 'amb',
          pid: '028048884',
          eyr: '2023',
          hcl: '#cfa07d',
          byr: '1929',
          iyr: '2013',
          cid: '350'
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
          ecl: 'brn',
          pid: '760753108',
          eyr: '2024',
          hcl: '#ae17e1',
          byr: '1931',
          iyr: '2013',
          hgt: '179cm'
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
          ecl: 'brn',
          pid: '166559648',
          eyr: '2025',
          hcl: '#cfa07d',
          iyr: '2011',
          hgt: '59in'
        }
      )

      assert_equal(expected_passport, passport)
    end
  end
end
