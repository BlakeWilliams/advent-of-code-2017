#!/usr/bin/env ruby

class SpiralGenerator
  def initialize(target)
    group = [[1, 2], [4, 5], [10, 11], [23, 25]]
    max = 0
    loop do
      break if max == 3
      last_group = group
      new_width = last_group.first + 3
      group = []

      1.upto(4) do
      end
      max += 1
    end

    puts group.inspect
  end
end
