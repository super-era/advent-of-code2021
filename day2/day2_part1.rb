# thinking about the problem before starting
# ----------------------------------------------
# I can still read each line but now I need to split
# each line by the space in each entry. Hashing 
# would be perfect in this situation.
# ----------------------------------------------
# Hashes need unique keys!! I'm better off constructing
# an array of arrays.

# thoughts after solving the problem
# ---------------------------------------------
# - I've been using .at which probably hasn't been 
#   necessary for a good long while - your notes are
#   outdated
# - there's gotta be a way to combine opening and 
#   and splitting by newline with the split methods.


file = File.open("test.txt")
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

x_count = 0
y_count = 0


arr.each do |step|
  case step[0]
  when "forward"
    x_count = x_count + step[1]
  when "down"
    y_count = y_count + step[1]
  when "up"
    y_count = y_count - step[1]
  end
end

puts "horizontal position: #{x_count}"
puts "depth: #{y_count}"
puts "position: #{x_count * y_count}"











    

