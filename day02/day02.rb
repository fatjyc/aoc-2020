#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

inputs = []
File.open("input", "r") do |f|
  f.each_line do |line|
    inputs.push(line)
  end
end

part1 = inputs.select do |input|
    min, max, char, str = input.match(/^(\d+)-(\d+) (\w): (\w+)$/i).captures
    count = str.count(char)
    min.to_i <= count && count <= max.to_i
end.count

part2 = inputs.select do |input|
    p1, p2, char, str = input.match(/^(\d+)-(\d+) (\w): (\w+)$/i).captures
    (str[p1.to_i - 1] == char && str[p2.to_i - 1] != char) || (str[p1.to_i - 1] != char && str[p2.to_i - 1] == char)
end.count

puts "part1: #{part1}"
puts "part2: #{part2}"
