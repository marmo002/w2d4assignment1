schedule = [
{train: "72C", frequency_in_minutes: 15, direction: "north", departure: 6},
{train: "72D", frequency_in_minutes: 15, direction: "south", departure: 7},
{train: "610", frequency_in_minutes: 5, direction: "north", departure: 11},
{train: "611", frequency_in_minutes: 5, direction: "south", departure: 9},
{train: "80A", frequency_in_minutes: 30, direction: "east", departure: 10},
{train: "80B", frequency_in_minutes: 30, direction: "west", departure: 11},
{train: "110", frequency_in_minutes: 15, direction: "north", departure: 12},
{train: "111", frequency_in_minutes: 15, direction: "south", departure: 13}
]



def get_direction(train_list, train_name)
  train = train_list.select do |trains|
    trains[:train] == train_name
  end

  train = train[0][:direction]
  train
end
train_111 = get_direction(schedule, "111")
puts "Train 111 goes \"#{train_111}\"."

train_80B = get_direction(schedule, "80B")
puts "Train 80B goes \"#{train_80B}\"."

train_610 = get_direction(schedule, "610")
puts "Train 610 goes \"#{train_610}\"."

# Add name of train into array if it travels north
def trains_by_direction(train_list, direction)
  trains_north = train_list.select do |trains|
    trains[:direction] == direction
  end

  trains_north.map! do |trains|
    trains[:train]
  end

  trains_north.each do |name|
    puts " -#{name}"
  end
end

puts "Trains going North:"
trains_by_direction(schedule, "north")

puts "Trains going East:"
trains_by_direction(schedule, "east")

# find out what train leaves at certain time
def first_departure_time(list, time)

  trains_at_11 = list.select do |trains|
    trains[:departure] == time
  end

  trains_at_11.map! do |train|
    train[:train]
  end
end

puts "When do you wanna leave, from 6:00 to 13:00?"
user_time = gets.chomp.to_i

leaves_at = first_departure_time(schedule, user_time)
puts "If you wanna catch the first train at #{user_time}:00, you shoulkd take train(s):"
leaves_at.each { |name| puts " -#{name}"}
