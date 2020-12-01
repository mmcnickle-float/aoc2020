# frozen_string_literal: true

require 'set'

def expense_account(input)
  input.each do |number1|
    input.each do |number2|
      return (number1 * number2) if number1 + number2 == 2020
    end
  end

  nil
end

def expense_account_set(input)
  target = input.map { |number| 2020 - number }.to_set

  input.each do |number1|
    return number1 * (2020 - number1) if target.include?(number1)
  end

  nil
end

def expense_account_hash(input)
  target = input.each_with_object({}) do |number, hash|
    hash[2020 - number] = number
  end

  input.each do |number1|
    return number1 * target[number1] if target.include?(number1)
  end

  nil
end

def expense_account_three(input)
  input.each_with_index do |number1, i|
    input.each_with_index do |number2, j|
      next if i == j

      input.each_with_index do |number3, k|
        next if j == k

        return (number1 * number2 * number3) if number1 + number2 + number3 == 2020
      end
    end
  end

  nil
end

def expense_account_three_hash(input)
  target_a = input.each_with_object({}) do |b, hash|
    input.each do |c|
      diff = 2020 - b - c

      hash[diff] = [b, c] if diff.positive?
    end
  end

  input.each do |a|
    next unless target_a.include?(a)

    b, c = target_a[a]
    return a * b * c
  end

  nil
end

def expense_account_four(input)
  input.each_with_index do |number1, i|
    input.each_with_index do |number2, j|
      next if i == j

      input.each_with_index do |number3, k|
        next if j == k

        input.each_with_index do |number4, l|
          next if k == l

          return (number1 * number2 * number3 * number4) if number1 + number2 + number3 + number4 == 2020
        end
      end
    end
  end

  nil
end

def expense_account_four_hash(input)
  target_a = input.each_with_object({}) do |b, hash|
    input.each do |c|
      input.each do |d|
        diff = 2020 - b - c - d

        hash[diff] = [b, c, d] if diff.positive?
      end
    end
  end

  input.each do |a|
    next unless target_a.include?(a)

    b, c, d = target_a[a]
    return a * b * c * d
  end

  nil
end
