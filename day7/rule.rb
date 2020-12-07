# frozen_string_literal: true

require 'set'

BagRule = Struct.new(:name, :number)

Rule = Struct.new(:links) do
  def self.parse(rule_text)
    pattern = /(\d)* ?(\w* \w*) bags?/

    bags = rule_text.scan(pattern).map do |number, bag_name|
      if bag_name == 'no other'
        BagRule.new(nil, nil)
      else
        BagRule.new(bag_name.sub(' ', '_').to_sym, number.to_i)
      end
    end

    parent, *children = bags

    links = children.map do |child|
      [parent.name, child.name, child.number]
    end

    new(links)
  end
end
