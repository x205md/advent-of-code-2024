input_file = './input.txt'

left_list = []
right_list = {}
right_list.default = 0

File.foreach(input_file) do |line|
  left, right = line.chomp.split
  left_list << left.to_i

  right = right.to_i
  right_list[right] = right_list[right] + 1
end

sim = 0
left_list.each do |left|
  sim += left * right_list[left]
end

print "Similarity : #{sim}\n"
