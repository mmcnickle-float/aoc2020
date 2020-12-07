# frozen_string_literal: true

Rule = Struct.new(:links) do
  def self.parse(rule_text)
    pattern = /(\w* \w*) bags?/

    bags = rule_text.scan(pattern).map do |bag_name|
      if bag_name.first == 'no other'
        nil
      else
        bag_name.first.sub(' ', '_').to_sym
      end
    end

    parent, *children = bags

    links = children.map do |child|
      [parent, child]
    end

    new(links)
  end
end
