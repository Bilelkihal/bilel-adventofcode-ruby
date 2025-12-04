content = File.read("day_2/input.txt")
input = content.split(",")

invalid_numbers = []

input.each do |range|
  parsed_range = range.split("-").map(&:to_i)
  for i in parsed_range.first..parsed_range.last
    str = i.to_s
    l = str.length

    next if l % 2 == 1

    half = l/2

    first_half = str[0..(half - 1)]
    last_half = str[half..(l-1)]
    if first_half == last_half
      invalid_numbers << i 
    end
  end
end

puts "sum: #{invalid_numbers.sum}"