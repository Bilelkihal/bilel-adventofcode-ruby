require 'pry'

content = File.read("day_5/example_2.txt")

ranges = content.split("\n").map{|r| r.split('-').map(&:to_i)}

ranges = ranges.sort_by{|r| r.first}
overlapse_present = true

# remove overlapsing ranges
while overlapse_present
  overlapse_present = false
  
  i = 0
  while i<(ranges.length-1)
    range = ranges[i]
    n_range = ranges[i+1]

    if range.last < n_range.first
      i+=1
    else
      overlapse_present = true
      b_r = range.first
      e_r = [range.last, n_range.last].max
      ranges[i] = [b_r, e_r]
      ranges.delete_at(i+1)
    end 
  end
end

valid_numbers_count = 0

ranges.each do |range|
  valid_numbers_count += (range.last - range.first + 1)
end

puts valid_numbers_count