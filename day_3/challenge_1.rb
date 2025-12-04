input = File.readlines("day_3/input.txt", chomp: true)

numbers_list = []

input.each do |battery|
  first_degit_arr = battery[0..battery.length - 2].split('')

  first_degit = first_degit_arr.map(&:to_i).max
 
  first_degit_index = first_degit_arr.index(first_degit.to_s)

  second_degit_arr = battery[(first_degit_index + 1)..(battery.length - 1)].split('')

  second_degit =  second_degit_arr.map(&:to_i).max

  number = "#{first_degit}#{second_degit}".to_i

  numbers_list << number
end


puts numbers_list.sum

