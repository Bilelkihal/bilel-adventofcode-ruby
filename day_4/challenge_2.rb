require 'pry'

def count_adjacent_papers(row, column, max_row, max_column, matrix)
  number_of_papers = 0
  
  for i in -1..1 do
    for j in -1..1 do 
      new_row = row + i
      next if new_row == -1 || new_row > max_row

      new_column = column + j
      next if new_column == -1 || new_column > max_column

      next if row == new_row && column == new_column

      if matrix[new_row][new_column] == '@' || matrix[new_row][new_column] == 'd' 
        number_of_papers += 1
      end
    end
  end
  number_of_papers
end

def clean_matrix(matrix)
  matrix.each_with_index do |arr, row|
    arr.each_with_index do |a, column|
      if a == 'd'
        matrix[row][column] = '.'
      end
    end
  end
  matrix
end

input = File.readlines("day_4/input.txt", chomp: true)
matrix = input.map(&:chars)

rolls_count = 0
total = 0

while true do
  matrix.each_with_index do |arr, row|
    arr.each_with_index do |a, column|
      next unless a == '@'
      count = count_adjacent_papers(row, column, matrix.length - 1, arr.length - 1, matrix)

      if count < 4
        rolls_count += 1
        matrix[row][column] = 'd'
      end
    end
  end

  matrix = clean_matrix(matrix)

  total += rolls_count
  break if rolls_count == 0

  rolls_count = 0
end


puts total