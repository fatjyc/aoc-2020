#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

def num_valid? arr, num
  arr.sort.each do |n|
    arr.sort.each do |m|
      if n + m == num and n != m
        return true
      end
    end
  end
  return false
end

def part1_func inputs, property
end

inputs = File.read("input").split("\n").map(&:to_i)

puts "part1: #{part1(inputs, 25)}"
