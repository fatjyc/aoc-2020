#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require "test/unit"
require_relative "./day06"

class TestDay06 < Test::Unit::TestCase
  def test_part1
    input = File.read("input_example")
    assert_equal 11, part1(input), "result is error"
  end

  def test_part2
    input = File.read("input_example")
    assert_equal 6, part2(input), "result is error"
  end
end