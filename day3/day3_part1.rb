# thoughts after solving the problem
# ---------------------------------------------
# - this is downright painful, constructing 
#   these multiple arrays, there has to be an 
#   easier way

file = File.open("day3.txt")
data = file.readlines.map(&:chomp)

array_length = data.length

num_digits = data[0].length

def mode_digit(digit, array)
  a1 = []
  array.each do |line|
    a1 << line.split("")[digit].to_i
  end
  return a1
end

count = 0

a = []

while count < num_digits
  a << mode_digit(count, data)
  count = count + 1
end

count1s = 0
count0s = 0
gamma = ""      # most common bit
epsilon = ""    # least common bit

for array in a
  for number in array
    if number == 1
      count1s = count1s + 1
    else
      count0s = count0s + 1
    end
  end
  if count1s > count0s
    gamma = gamma + 1.to_s
    epsilon = epsilon + 0.to_s
  else 
    gamma = gamma + 0.to_s
    epsilon = epsilon + 1.to_s
  end
  count1s = 0    # reset
  count0s = 0    # reset
  puts "gamma: #{gamma}"
  puts "epsilon: #{epsilon}"
  puts "==================="
end

gamma = gamma.to_i(2)
epsilon = epsilon.to_i(2)

puts "#{gamma} * #{epsilon} = #{gamma * epsilon}"







