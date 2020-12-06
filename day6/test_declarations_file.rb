# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'declarations_file'

describe DeclarationsFile do
  describe '#declarations' do
    it 'returns a list of group_declarations' do
      filedata = <<~FILEDATA
        abc

        a
        b
        c

        ab
        ac

        a
        a
        a
        a

        b

      FILEDATA

      file = StringIO.new(filedata)

      declarations_file = DeclarationsFile.new(file)

      expected_declarations = [
        %w[abc],
        %w[a b c],
        %w[ab ac],
        %w[a a a a],
        %w[b]
      ]

      declarations = declarations_file.declarations

      assert_equal(expected_declarations, declarations)
    end
  end
end
