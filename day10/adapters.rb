# frozen_string_literal: true

Adapters = Struct.new(:joltages) do
  def joltage_differences
    indexes = 0...(joltage_chain.length - 1)
    indexes.map { |i| joltage_chain[i + 1] - joltage_chain[i] }
  end

  def compressible_link_lengths
    link_lengths = []

    current_link_length = 0

    joltage_differences.each do |diff|
      if diff == 3
        link_lengths << current_link_length
        current_link_length = 0
      else
        current_link_length += 1
      end
    end

    link_lengths.reject(&:zero?)
  end

  def number_of_combinations
    link_combinations = compressible_link_lengths.map do |length|
      if length == 4
        2**(length - 1) - 1
      else
        2**(length - 1)
      end
    end

    link_combinations.inject(&:*)
  end

  def joltage_chain
    [outlet_joltage, *joltages.sort, device_joltage]
  end

  def joltage_distribution
    joltage_differences.tally
  end

  def outlet_joltage
    0
  end

  def device_joltage
    joltages.max + 3
  end

  def self.from_file(file)
    joltages = file.lines.map(&:to_i)
    new(joltages)
  end
end
