file = File.open("day2.txt")
# each line in the file is now a string in this array
data = file.readlines.map(&:chomp)
# split strings and assign to hash - second value needs
# to be cast to integer types

a1 = []
a2 = []

data.each do |line|
  a1 << line.split(" ")[0]
  a2 << line.split(" ")[1].to_i
end

arr = a1.zip(a2)

puts "#{arr}"

aim = 0
depth = 0
position = 0

arr.each do |step|
  case step[0]
  when "forward"
    position = position + step[1]
    depth = depth + aim * step[1]
  when "down"
    aim = aim + step[1]
  when "up"
    aim = aim - step[1]
  end
  # puts "horizontal position: #{position}"
  # puts "depth: #{depth}"
  # puts "overall location: #{position * depth}"
  # puts "--------------------------------"
end

puts "horizontal position: #{position}"
puts "depth: #{depth}"
puts "overall location: #{position * depth}"












    

