#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-


class Passport

  def initialize input
    fields = input.split(" ")
    fields.each do | field |
      if field.start_with? "byr:"
        @byr = field.gsub "byr:", ""
      end
      if field.start_with? "iyr:"
        @iyr = field.gsub "iyr:", ""
      end
      if field.start_with? "eyr:"
        @eyr = field.gsub "eyr:", ""
      end
      if field.start_with? "hgt:"
        @hgt = field.gsub "hgt:", ""
      end
      if field.start_with? "hcl:"
        @hcl = field.gsub "hcl:", ""
      end
      if field.start_with? "ecl:"
        @ecl = field.gsub "ecl:", ""
      end
      if field.start_with? "pid:"
        @pid = field.gsub "pid:", ""
      end
      if field.start_with? "cid:"
        @cid = field.gsub "cid:", ""
      end
    end
  end

  def byr_valid?
    @byr =~ /^[0-9]{4}$/ && @byr.to_i >= 1920 && @byr.to_i <= 2002
  end

  def iyr_valid?
    @iyr =~ /^[0-9]{4}$/ && @iyr.to_i >= 2010 && @iyr.to_i <= 2020
  end

  def eyr_valid?
    @eyr =~ /^[0-9]{4}$/ && @eyr.to_i >= 2020 && @eyr.to_i <= 2030
  end

  def hcl_valid?
    @hcl =~ /^#[0-9a-f]{6}$/
  end

  def ecl_valid?
    @ecl =~ /^amb|blu|brn|gry|grn|hzl|oth$/
  end

  def pid_valid?
    @pid =~ /^[0-9]{9}$/
  end

  def hgt_valid?
    return false unless @hgt =~ /^[0-9]+(cm|in)$/
    if @hgt.end_with?("cm")
      num = @hgt.gsub "cm", ""
      unless num.to_i >= 150 && num.to_i <= 193
        return false
      end
    elsif @hgt.end_with?("in")
      num = @hgt.gsub "in", ""
      unless num.to_i >= 59 && num.to_i <= 76
        return false
      end
    else
      return false
    end
    true
  end

  def missing_fields_valid?
    @byr && @iyr && @eyr && @hgt && @hcl && @ecl && @pid
  end

  def legal_fields_valid?
    return false unless self.missing_fields_valid?
    self.byr_valid? && self.iyr_valid? && self.eyr_valid? && self.hcl_valid? && self.ecl_valid? && self.pid_valid? && self.hgt_valid?
  end

  def to_s
    "[\n\tbyr: #{@byr}\n\tiyr: #{@iyr}\n\teyr: #{@eyr}\n\thgt: #{@hgt}\n\thcl: #{@hcl}\n\tecl: #{@ecl}\n\tpid: #{@pid}\n\tcid: #{@cid}\n]"
  end

end

input = File.read("input")
passports = input.split("\n\n").map{|inpt| Passport.new(inpt) }

part1 = passports.select do |passport|
  passport.missing_fields_valid?
end.count

part2 = passports.select do |passport|
  passport.legal_fields_valid?
end.count

puts "part1: #{part1}"
puts "part2: #{part2}"