# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'declarations'

module Declarations
  describe 'num_questions_answered' do
    it 'the number of questions answered yes' do
      test_cases = [
        [%w[abc], 3],
        [%w[abcx abcy abcz], 6],
        [%w[a b c], 3],
        [%w[ab ac], 3],
        [%w[a a a a], 1],
        [%w[b], 1]
      ]

      test_cases.each do |list, num|
        assert_equal(num, Declarations.num_questions_answered(list))
      end
    end
  end

  describe 'num_questions_everyone_answered' do
    it 'the number of questions eveyone answered yes to' do
      test_cases = [
        [%w[abc], 3],
        [%w[abcx abcy abcz], 3],
        [%w[a b c], 0],
        [%w[ab ac], 1],
        [%w[a a a a], 1],
        [%w[b], 1]
      ]

      test_cases.each do |list, num|
        assert_equal(num, Declarations.num_questions_everyone_answered(list))
      end
    end
  end
end
