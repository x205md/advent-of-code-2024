def cmp(left, right)
  result = left - right

  if result.abs <= 0 || result.abs > 3
    :none
  elsif !result.positive?
    :inc
  elsif result.positive?
    :dec
  else
    :none
  end
end

input = File.readlines('./input.txt', chomp: true)
lines = input.map do |line|
  line.split.map(&:to_i)
end

result = []
lines.each do |line|
  r = []
  final = line.count - 1

  for i in 1..final do
    r << cmp(line[i-1], line[i])
  end

  result << r
end

answer = result.map(&:uniq).map(&:count).filter { |i| i == 1 }.sum
puts answer

answer2 = result.map(&:tally).filter do |r|
  r.count <= 2 && (r[:none].nil? || r[:none] < 2) && r.filter { |_, v| v > 1}.count == 1
end
