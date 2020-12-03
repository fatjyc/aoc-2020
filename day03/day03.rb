#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

input = File.read("input")
$maps = input.split("\n")

def route slopeX, slopeY
    x = 0
    y = 0
    count = 0
    begin
      x += slopeX
      y += slopeY
      x -= $maps[0].length if x >= $maps[0].length
      count += 1 if $maps[y][x] == "#"        
    end while y < $maps.length - 1
    count 
end

part1 = route(3, 1)

puts "part1: #{part1}"

part2 = route(1, 1) * route(3, 1) * route(5, 1) * route(7, 1) * route(1, 2)

puts "part2: #{part2}"
