file = File.open("test copy.txt")
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

def each_value_an_array(array)
  b1 = []
  array.each do |line|
    b2 = []
    b2 << line.split("")
    b1 << b2
  end
  return b1
end

arr = each_value_an_array(data)

count = 0

a = []

o2_co2 = []

while count < num_digits
  a << mode_digit(count, data)
  count = count + 1
end

count = 0
count1s = 0
count0s = 0
gamma = ""      # most common bit
epsilon = ""    # least common bit; which is simply the opposite bit to the gamma-assigned bit... there has to be an easier way to do this...
o2 = []
co2 = []
temp = []  

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
    if count < 1
      arr.each do |num|
        if num.chars.first == 1
          temp << num
        end
      end
    elsif 1 < count < num_digits
      t2 = []
      temp.each do |num|
        if num.chars.first == 1
          t2 << num
        end
      temp = t2
    end    
    count = count + 1        
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