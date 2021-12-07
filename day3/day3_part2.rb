# Ideas for future implementation
# -------------------------------------------------
# - a lot of repeated code that needs to be deleted

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

def find_o2_rating(count, data)   
  array = mode_digit(count, data)
#   puts "array = #{array}"
  count1s = 0
  count0s = 0
  for num in array
    if num == 1
      count1s = count1s + 1
    else
      count0s = count0s + 1
    end
  end
  index_record = 0
  index_record_arr = []
  if count1s >= count0s
    for num in array
      if num == 1
        index_record_arr << index_record
      end
      index_record = index_record + 1
    end
    o2_array = []
    for num in index_record_arr
      o2_array << data[num]
    end
  else  #count1s < count0s
    for num in array
      if num == 0
        index_record_arr << index_record
      end
      index_record = index_record + 1
    end
    o2_array = []
    for num in index_record_arr
      o2_array << data[num]
    end
  end
#   puts "O2 array = #{o2_array}"
#   puts "-----------------"
  if o2_array.length == 1
    return o2_array[0].to_i(2)  
  else
    return find_o2_rating(count + 1, o2_array)
  end 
end

def find_co2_rating(count, data)   
  array = mode_digit(count, data)
#   puts "array = #{array}"
  count1s = 0
  count0s = 0
  for num in array
    if num == 1
      count1s = count1s + 1
    else
      count0s = count0s + 1
    end
  end
  index_record = 0
  index_record_arr = []
  if count1s >= count0s
    for num in array
      if num == 0
        index_record_arr << index_record
      end
      index_record = index_record + 1
    end
    co2_array = []
    for num in index_record_arr
      co2_array << data[num]
    end
  else  #count1s <= count0s
    for num in array
      if num == 1
        index_record_arr << index_record
      end
      index_record = index_record + 1
    end
    co2_array = []
    for num in index_record_arr
      co2_array << data[num]
    end
  end
#   puts "CO2 array = #{co2_array}"
#   puts "-----------------"
  if co2_array.length == 1
    return co2_array[0].to_i(2)  
  else
    return find_co2_rating(count + 1, co2_array)
  end 
end

 
puts "#{find_o2_rating(count, data)} * #{find_co2_rating(count, data)} = #{find_o2_rating(count, data) * find_co2_rating(count, data)}"




    