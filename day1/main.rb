input_file = './input.txt'

left_list = []
right_list = []

File.foreach(input_file) do |line|
  left, right = line.chomp.split
  left_list << left.to_i
  right_list << right.to_i
end

left_list.sort!
right_list.sort!

acc = 0
left_list.each_with_index do |left, i|
  acc += (left - right_list[i]).abs
end

print "Distance : #{acc}\n"
