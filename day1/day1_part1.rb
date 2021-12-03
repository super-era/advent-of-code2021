# Ideas for further improvement
# ---------------------------------------
# - figure out a way to compare two values
#   and increment count without saving the
#   data to an integer array

file = File.open("day1.txt")
data = file.readlines.map(&:to_i)

puts "number of values = #{data.length}"

count = 0
i = 0
j = 1

until j == data.length do
  if data.at(i) < data.at(j)
    count = count + 1
  end
  # puts "count = #{count}, i = #{i}, j = #{j}"
  i = i + 1
  j = j + 1
end

puts "count = #{count}"