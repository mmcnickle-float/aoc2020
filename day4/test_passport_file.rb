# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'passport_file'
require_relative 'fields'

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
            ecl: Field::Ecl.new('gry'),
            pid: Field::Pid.new('860033327'),
            eyr: Field::Eyr.new(2020),
            hcl: Field::Hcl.new('#fffffd'),
            byr: Field::Byr.new(1937),
            iyr: Field::Iyr.new(2017),
            cid: Field::Cid.new('147'),
            hgt: Field::Hgt.new(183, 'cm')
          }
        ),
        Passport.new(
          {
            ecl: Field::Ecl.new('amb'),
            pid: Field::Pid.new('028048884'),
            eyr: Field::Eyr.new(2023),
            hcl: Field::Hcl.new('#cfa07d'),
            byr: Field::Byr.new(1929),
            iyr: Field::Iyr.new(2013),
            cid: Field::Cid.new('350')
          }
        ),
        Passport.new(
          {
            ecl: Field::Ecl.new('brn'),
            pid: Field::Pid.new('760753108'),
            eyr: Field::Eyr.new(2024),
            hcl: Field::Hcl.new('#ae17e1'),
            byr: Field::Byr.new(1931),
            iyr: Field::Iyr.new(2013),
            hgt: Field::Hgt.new(179, 'cm')
          }
        ),
        Passport.new(
          {
            ecl: Field::Ecl.new('brn'),
            pid: Field::Pid.new('166559648'),
            eyr: Field::Eyr.new(2025),
            hcl: Field::Hcl.new('#cfa07d'),
            iyr: Field::Iyr.new(2011),
            hgt: Field::Hgt.new(59, 'in')
          }
        )
      ]

      passports = passport_file.passports

      assert_equal(expected_passports, passports)
    end
  end
end
