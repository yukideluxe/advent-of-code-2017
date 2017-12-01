puts "Enter Input"
input = gets.chomp
array = input.split('').reverse

result = array.each_with_index.reduce(0) do |sum, (digit, i)|
  sum += digit.to_i if digit == array[i - 1]

  sum
end

puts result
