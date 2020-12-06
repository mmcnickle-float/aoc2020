# frozen_string_literal: true

class DeclarationsFile
  def initialize(file)
    @file = file
  end

  def declarations
    file.read.split(/\n\n/).map(&:split)
  end

  private

  attr_reader :file
end
