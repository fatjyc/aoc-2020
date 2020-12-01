#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

def part1_func input
  result = []
  input.each do |i|
    input.each do |ii|
      if i + ii == 2020
        result.push(i * ii)
      end
    end
  end
  result.max
end

def part2_func input
  result = []
  input.each do |i|
    input.each do |ii|
      input.each do |iii|
        if i + ii + iii == 2020
          result.push(i * ii * iii)
        end
      end
    end
  end
  result.max
end

inputs = []
File.open("input", "r") do |f|
  f.each_line do |line|
    line = line.to_i
    inputs.push(line)
  end
end


puts "part1: #{part1_func(inputs)}"
puts "part2: #{part2_func(inputs)}"
