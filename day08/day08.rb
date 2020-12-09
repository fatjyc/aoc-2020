#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

class Instruction
  attr_accessor :operation, :argument
  def initialize line
    @operation, @argument = line.split(" ")
    @haveRun = false
  end
end

class Computer
  attr_reader :acc, :history
  def initialize instructions
    @instructions = instructions
    @index = 0
    @acc = 0
    @history = []
  end

  def step
    if @history.include?(@index)
      return -1
    end
    @history.append(@index)
    if @index >= @instructions.size - 1
      return 1
    end
    ins = @instructions[@index]
    case ins.operation
      when "acc"
        @acc += ins.argument.to_i
        @index += 1
      when "jmp"
        @index += ins.argument.to_i
      else
        @index += 1
    end
    return 0
  end

  def run
    code = 0
    while code == 0
      code = self.step
    end
    return code
  end
end


def part1_func instructions
  c = Computer.new(instructions)
  while c.step == 0
    c.step
  end
  return c.acc
end

def part2_func instructions
  c = Computer.new(instructions)
  while c.step == 0
    c.step
  end

  for ptr in c.history.reverse
    modified_instructions = instructions
    case modified_instructions[ptr].operation
    when "nop"
      modified_instructions[ptr].operation = "jmp"
    when "jmp"
      modified_instructions[ptr].operation = "nop"
    else
      next
    end
    c2 = Computer.new(modified_instructions)
    returnCode = c2.run
    if returnCode == 1
      return c2.acc
    end
  end
end

instructions = File.read("input").split("\n").map{|ins| Instruction.new(ins)}

puts "part1: #{part1_func(instructions)}"
puts "part2: #{part2_func(instructions)}"
