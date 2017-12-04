#!/usr/bin/env ruby

class SpiralCounter
  attr_reader :spirals

  def initialize(target_number)
    @target = target_number
    @dimensions = find_dimensions

    generate_spirals
  end

  def distance_to_one
    depth_difference = (@dimensions - 1) / 2
    spirals.last.distance_to_middle(@target) + depth_difference
  end

  private

  def generate_spirals
    @spirals = (3..@dimensions).step(2).map do |dimension|
      puts dimension * dimension
      start_number = (dimension - 2) * (dimension - 2)
      numbers = start_number.upto(dimension * dimension).to_a
      numbers.shift

      Spiral.new(numbers, dimension)
    end
  end

  def find_dimensions
    dimensions = 1

    while @target > dimensions * dimensions
      dimensions += 2
    end

    dimensions
  end
end

class Spiral
  def initialize(numbers, depth)
    @groups = numbers.each_slice(numbers.length / 4).to_a
  end

  def distance_to_middle(target)
    group = @groups.find { |a| a.include?(target) }
    middle_index = (group.length - 1) / 2
    target_index = group.index(target)

    (middle_index - target_index).abs
  end
end

a = SpiralCounter.new(361527)
puts a.distance_to_one
