#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

def get_seat path
  row = (0..127).to_a
  column = (0..7).to_a
  path.each_char do |ch|
    case ch
    when 'F'
      row = row.slice(0, row.size / 2)
    when 'B'
      row = row.slice(row.size / 2, row.size)
    when 'R'
      column = column.slice(column.size / 2, column.size)
    when 'L'
      column = column.slice(0, column.size / 2)
    end
  end
  row.first * 8 + column.first
end

lines = File.read("input").split("\n")
seats = lines.map do |line|
  get_seat(line)
end

part1 = seats.max

part2 = ((0..seats.max).to_a - seats).select{|seat| seats.include?(seat - 1) && seats.include?(seat + 1) }.first

puts "part1: #{part1}"
puts "part2: #{part2}"
