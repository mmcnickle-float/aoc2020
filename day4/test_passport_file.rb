# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'passport_file'

describe PassportFile do
  describe '#passports' do
    it 'returns a list of passports' do
      passport_filedata = <<~PASSPORT_FILEDATA
        ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
        byr:1937 iyr:2017 cid:147 hgt:183cm

        iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
        hcl:#cfa07d byr:1929

        hcl:#ae17e1 iyr:2013
        eyr:2024
        ecl:brn pid:760753108 byr:1931
        hgt:179cm

        hcl:#cfa07d eyr:2025 pid:166559648
        iyr:2011 ecl:brn hgt:59in
      PASSPORT_FILEDATA

      file = StringIO.new(passport_filedata)

      passport_file = PassportFile.new(file)

      expected_passports = [
        Passport.new(
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
        ),
        Passport.new(
          {
            ecl: 'amb',
            pid: '028048884',
            eyr: '2023',
            hcl: '#cfa07d',
            byr: '1929',
            iyr: '2013',
            cid: '350'
          }
        ),
        Passport.new(
          {
            ecl: 'brn',
            pid: '760753108',
            eyr: '2024',
            hcl: '#ae17e1',
            byr: '1931',
            iyr: '2013',
            hgt: '179cm'
          }
        ),
        Passport.new(
          {
            ecl: 'brn',
            pid: '166559648',
            eyr: '2025',
            hcl: '#cfa07d',
            iyr: '2011',
            hgt: '59in'
          }
        )
      ]

      passports = passport_file.passports

      assert_equal(expected_passports, passports)
    end
  end
end
