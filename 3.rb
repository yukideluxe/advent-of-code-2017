def find_vector(number)
  return [0, 0] if number == 1

  current_number = 1
  x, y = [0, 0]
  dx, dy = [1, 0]

  distance = 1
  direction_changes = 0

  while true
    distance.times do
      current_number += 1

      x += dx
      y += dy

      if current_number == number
        return [x, y]
      end
    end

    # change direction
    direction_changes += 1
    dx, dy = if [dx, dy] == [1, 0]
               [0, 1]
             elsif [dx, dy] == [0, 1]
               [-1, 0]
             elsif [dx, dy] == [-1, 0]
               [0, -1]
             elsif [dx, dy] == [0, -1]
               [1, 0]
             end

    # every two changes of direction the distance increases
    if direction_changes % 2 == 0
      distance += 1
    end
  end

  return [x, y]
end

def manhattan_distance(origin, destination)
  origin_vector = find_vector(origin)
  destination_vector = find_vector(destination)

  (origin_vector.first - destination_vector.first).abs + (origin_vector.last - destination_vector.last).abs
end

puts "Data :: 1"
puts manhattan_distance(1, 1)
puts "Data :: 12"
puts manhattan_distance(12, 1)
puts "Data :: 23"
puts manhattan_distance(23, 1)
puts "Data :: 1024"
puts manhattan_distance(1024, 1)
puts "Data :: 368078"
puts manhattan_distance(368078, 1)
