file = File.open("test.txt")
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
    b1 << line.split("")
  end
  return b1
end

def construct_o2_co2_array(index, init_arr, new_arr, gamma_epsilon_arr)
  value_index = 0
  while value_index < init_arr.length do
    if gamma_epsilon_arr[index] == init_arr[value_index][index]
      new_arr << init_arr[value_index]
    end
    puts "#{new_arr}"
    puts "----------"
    value_index = value_index + 1
  end
  next_new_arr = []
  if index == gamma_epsilon_arr.length
    return new_arr
  else
    puts "Index is now #{index + 1}!"
    return construct_o2_co2_array(index + 1, new_arr, next_new_arr, gamma_epsilon_arr)
  end
end

arr = each_value_an_array(data)

puts "arr length is #{arr.length}"

count = 0

o2_co2 = []

def construct_gamma_epsilon_arr(arr)
  a = []
  while count < num_digits
    a << mode_digit(count, data)
    count = count + 1
  end
  return a
end

a = construct_gamma_epsilon_arr(data)

count = 0
count1s = 0
count0s = 0
gamma = ""      # most common bit
epsilon = ""    # least common bit; which is simply the opposite bit to the gamma-assigned bit... there has to be an easier way to do this...
o2 = []
co2 = []
temp = []  

def get_o2_rating(array)
  for array in a
    for number in array
      if number == 1
        count1s = count1s + 1
      else
        count0s = count0s + 1
      end
    end
    if count1s >= count0s
      gamma = gamma + 1.to_s
      epsilon = epsilon + 0.to_s
      gamma_arr = gamma.split("")
      temp = construct_o2_co2_array(0, arr, o2, gamma_arr)
      temp.each do |arr|
        arr.join("")
      end
      count = 0
      temp = construct_gamma_epsilon_arr(count, temp)
      return get_o2_rating(temp)
    else 
      gamma = gamma + 0.to_s
      epsilon = epsilon + 1.to_s
    end
    count1s = 0    # reset
    count0s = 0    # reset
    # puts "gamma: #{gamma}"
    # puts "epsilon: #{epsilon}"
    # puts "==================="
  end
end

puts "gamma: #{gamma}"
puts "epsilon: #{epsilon}"
puts "==================="

gamma_arr = gamma.split("")
epsilon_arr = epsilon.split("")

puts "#{construct_o2_co2_array(0, arr, o2, gamma_arr)}"