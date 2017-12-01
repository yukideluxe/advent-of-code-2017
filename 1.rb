puts "Enter Input"
input = gets.chomp
array = input.split('').reverse

distance = array.size / 2

result = array.each_with_index.reduce(0) do |sum, (digit, i)|
  sum += digit.to_i if digit == array[i - distance]

  sum
end

puts result
