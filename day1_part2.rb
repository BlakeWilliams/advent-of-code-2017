#!/usr/bin/env ruby

class CircularList
  include Enumerable

  def initialize(list)
    @value = list
  end

  def [](index)
    size = @value.length
    @value[index % size]
  end

  def length
    @value.length
  end

  def each
    return enumerable unless block_given?

    enumerable.each { |val| yield val }
  end

  private

  def enumerable
    @value.each
  end
end

class Captcha
  attr_reader :value

  def initialize(list)
    @value = 0
    @list = CircularList.new(list)
  end

  def solve
    half = @list.length / 2

    @list.each_with_index do |digit, index|
      if digit == @list[index + half]
        @value += digit
      end
    end

    self
  end
end

data = STDIN.read.strip.split('').map(&:to_i)
captcha = Captcha.new(data)

puts captcha.solve.value
