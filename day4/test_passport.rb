# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'passport'

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
  end
end
