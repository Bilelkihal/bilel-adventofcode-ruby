def split_string(str, number)
  b = 0
  e = (str.length/number) - 1
  slice_length = e - b

  list = []

  number.times do
    list << str[b .. e]
    b = e + 1
    e = b + slice_length
  end

  list
end


content = File.read("day_2/input.txt")
input = content.split(",")

invalid_numbers = []

input.each do |range|
  parsed_range = range.split("-").map(&:to_i)
  for i in parsed_range.first..parsed_range.last
    str = i.to_s
    l = str.length
    for j in 2 .. str.length
      next unless l % j == 0

      match_array = split_string(str, j)

      if match_array.uniq.length == 1
        invalid_numbers << i
      end
    end
  end
end

puts "sum: #{invalid_numbers.uniq.sum}"











