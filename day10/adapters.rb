# frozen_string_literal: true

Adapters = Struct.new(:joltages) do
  def joltage_differences
    joltage_chain = [outlet_joltage, *joltages.sort, device_joltage]

    indexes = 0...(joltage_chain.length - 1)
    indexes.map { |i| joltage_chain[i + 1] - joltage_chain[i] }
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
