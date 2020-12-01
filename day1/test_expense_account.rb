# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'expense_account'

class ExpenseAccountTest < Minitest::Test
  def test_expense_account
    input = [
      1721,
      979,
      366,
      299,
      675,
      1456
    ]

    product = expense_account(input)

    assert product == 514_579
  end
end
