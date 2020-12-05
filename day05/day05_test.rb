#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require "test/unit"
require_relative "./day05"

class TestDay05 < Test::Unit::TestCase
  def test_get_seat
    line = "FBFBBFFRLR"

    assert_equal 357, get_seat(line), "result is error"

    lines = ["BFFFBBFRRR", "FFFBBBFRRR", "BBFFBBFRLL"]
    results = [567, 119, 820]
    lines.each_with_index{|line, index| assert_equal results[index], get_seat(line), "result is error" }
  end
end