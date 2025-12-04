lines = File.readlines("day_1/input.txt", chomp: true)

instructions = []

lines.each do |str|
  if str.start_with?('L')
    instructions << (str.delete_prefix("L").to_i) * -1
  else
    instructions << str.delete_prefix("R").to_i
  end
end

start = 50

number_of_zeros = 0

instructions.each do |i|
  instruction = i
  next if instruction == 0
  if instruction > 0
    while(instruction > 0)
      instruction -= 1
      start += 1
      if start == 100
        start = 0
        number_of_zeros +=1
      end
    end
  else
    instruction = instruction.abs
    while(instruction > 0)
      instruction -= 1
      start -= 1

      if start == 0
        number_of_zeros += 1
      end

      if start == -1
        start = 99
      end
    end
  end

end

puts "number of zeros: #{number_of_zeros}"