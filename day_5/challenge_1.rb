content = File.read("day_5/input_1.txt")
sections = content.split(/\n{2,}/)

ranges = sections.first.split("\n")

numbers = sections.last.split("\n")

fresh_numbers = []

ranges.each do |range|
  s, e = range.split('-').map(&:to_i)
  numbers.map(&:to_i).each do |number|
    next if number < s
    next if number > e
    fresh_numbers << number
  end
end

puts fresh_numbers.uniq.length