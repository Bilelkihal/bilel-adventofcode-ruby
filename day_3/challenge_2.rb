def first_appearance_in_string(str, c)
  i = 0
  str.split('').each do |chr|
    break if chr == c
    i += 1
  end
  i
end

input = File.readlines("day_3/input.txt", chomp: true)

numbers_list = []

input.each do |battery|
  arr = battery[0..battery.length - 12].split('')
  degit = arr.map(&:to_i).max

  degits_list = [degit]

  index = first_appearance_in_string(battery, degit.to_s)
  bat = battery
  11.times do |i| 
    bat = bat[(index + 1) .. bat.length - 1]
    new_degit_arr = bat[0..(bat.length - (11 - i))].split('') 
    new_degit = new_degit_arr.map(&:to_i).max

    degits_list << new_degit

    index = first_appearance_in_string(bat, new_degit.to_s)
  end 

  number = degits_list.join

  numbers_list << number

end

puts numbers_list.map(&:to_i).sum


