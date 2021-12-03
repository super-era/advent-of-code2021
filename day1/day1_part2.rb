# Ideas for further improvement
# ---------------------------------------
# - figure out a way to compare two values
#   and increment count without saving the
#   data to an integer array
# - perhaps I can add the three numbers 
#   together as I read the data into the 
#   array, then use part 1's method to
#   then compare the sliding windows?

file = File.open("day1.txt")
data = file.readlines.map(&:to_i)

puts "number of values = #{data.length}"

count = 0
i = 0
j = 1
k = 2
m = 3

until m == data.length do
  sliding_window1 = data.at(i) + data.at(j) + data.at(k)
  sliding_window2 = data.at(j) + data.at(k) + data.at(m)
  if sliding_window1 < sliding_window2
    count = count + 1
  end
  # puts "count = #{count}, i = #{i}, j = #{j}"
  i = i + 1
  j = j + 1
  k = k + 1
  m = m + 1
end

puts "count = #{count}"