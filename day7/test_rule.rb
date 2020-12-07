# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'rule'

describe Rule do
  describe '.parse' do
    describe 'empty rule' do
      it 'parses a rule with an empty link' do
        rule_text = 'faded blue bags contain no other bags.'
        rule = Rule.parse(rule_text)

        expected_links = [
          [:faded_blue, nil]
        ]

        assert_equal(expected_links, rule.links)
      end
    end

    describe 'rule with 1 child' do
      it 'parses a rule with a single link' do
        rule_text = 'bright white bags contain 1 shiny gold bag.'
        rule = Rule.parse(rule_text)

        expected_links = [
          %i[bright_white shiny_gold]
        ]

        assert_equal(expected_links, rule.links)
      end
    end

    describe 'rule with multiple children' do
      it 'parses a rule with 2 links' do
        rule_text = 'dark plum bags contain 2 wavy coral bags, 2 striped gray bags, 4 muted blue bags, 2 dull aqua bags.'
        rule = Rule.parse(rule_text)

        expected_links = [
          %i[dark_plum wavy_coral],
          %i[dark_plum striped_gray],
          %i[dark_plum muted_blue],
          %i[dark_plum dull_aqua]
        ]

        assert_equal(expected_links, rule.links)
      end
    end
  end
end
