#!/usr/bin/env ruby

class CircularList
  include Enumerable

  def initialize(list)
    @value = list
  end

  def [](index)
    return nil unless index
    @value[index]
  end

  def each
    return enumerable unless block_given?

    enumerable.each { |val| yield val }
  end

  private

  def enumerable
    Enumerator.new do |y|
      y << @value[-1]

      @value.each do |val|
        y << val
      end
    end
  end
end

class Captcha
  attr_reader :value

  def initialize(list)
    @value = 0
    @list = CircularList.new(list)
  end

  def solve
    @list.each do |digit|
      previous_digit = @current_digit
      @current_digit = digit

      if previous_digit == @current_digit
        @value += previous_digit
      end
    end

    self
  end
end

data = STDIN.read.strip.split('').map(&:to_i)
captcha = Captcha.new(data)

puts captcha.solve.value
