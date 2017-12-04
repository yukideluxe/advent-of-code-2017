# PART 1

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
end

def manhattan_distance(origin, destination)
  origin_vector = find_vector(origin)
  destination_vector = find_vector(destination)

  (origin_vector.first - destination_vector.first).abs + (origin_vector.last - destination_vector.last).abs
end

puts "Distance to 1"
puts manhattan_distance(1, 1)
puts "Distance to 12"
puts manhattan_distance(12, 1)
puts "Distance to 23"
puts manhattan_distance(23, 1)
puts "Distance to 1024"
puts manhattan_distance(1024, 1)
puts "Distance to 368078"
puts manhattan_distance(368078, 1)

## PART 2

def first_larger_number_than(number)
  current_number = 1
  x, y = [0, 0]
  dx, dy = [1, 0]

  values = {
    [x, y] => current_number
  }

  distance = 1
  direction_changes = 0

  while true
    distance.times do
      x += dx
      y += dy

      current_number =
        values[[x - 1, y]].to_i +
        values[[x, y - 1]].to_i +
        values[[x + 1, y]].to_i +
        values[[x, y + 1]].to_i +
        values[[x + 1, y + 1]].to_i +
        values[[x - 1, y - 1]].to_i +
        values[[x - 1, y + 1]].to_i +
        values[[x + 1, y - 1]].to_i

      values[[x, y]] = current_number

      if current_number > number
        return current_number
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
end

puts "First larger number than 10"
puts first_larger_number_than(10)

puts "First larger number than 142"
puts first_larger_number_than(142)

puts "First larger number than 368078"
puts first_larger_number_than(368078)
