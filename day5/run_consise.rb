seat_ids = File.read('codes.txt').lines.map { |c| c.gsub(/[FL]/, '0').gsub(/[BR]/, '1').to_i(2) }
puts "Max seat id: #{seat_ids.max}"
puts "Missing seat id: #{((seat_ids.min..seat_ids.max).to_a - seat_ids).first}"
