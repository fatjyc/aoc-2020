#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

input = File.read("input")

def part1 input
    input.split("\n\n").map do |group| 
        group.each_char.to_a.select{|c| c != "\n"}.uniq.count
    end.inject(:+)
end

def part2 input
    input.split("\n\n").map do |group| 
        lines = group.split("\n")
        h = Hash.new(0)
        group.each_char.to_a.select{|c| c != "\n"}.each{ |e| h[e] += 1 }
        h.map do |k,v|
            v == lines.size ? 1 : 0
        end.inject :+
    end.inject :+
end

puts "part1: #{part1(input)}"
puts "part2: #{part2(input)}"