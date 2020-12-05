# frozen_string_literal: true

Seat = Struct.new(:row, :column) do
  def self.from_code(code)
    row_code = code[0..6]
    column_code = code[7..10]

    row = row_code.gsub(/F/, '0').gsub(/B/, '1').to_i(2)
    column = column_code.gsub(/L/, '0').gsub(/R/, '1').to_i(2)

    new(row, column)
  end
end
