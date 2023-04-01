# frozen_string_literal: true

require 'minitest/autorun'

def solution1(input)
  max = 0
  0.upto(input.size - 1) do |i|
    i.upto(input.size - 1) do |j|
      max = [max, input[i..j].inject(&:+)].max
    end
  end
  max
end

def solution2(input)
  max = max_local = 0

  input.each do |value|
    max_local = [value, value + max_local].max
    max = [max, max_local].max
  end
  max
end

def solution1_wrap(input)
  max = max_local = max_wrap = 0

  input.size.times do |index|
    value = input[index]
    value_prev = index > 0 ?  input[index - 1] : 0

    # puts "index #{index} : value #{value} (prev #{value_prev})"

    max_local = [value, value + max_local].max
    max_wrap = [value_prev, value + max_wrap].max
    max = [max, max_local, max_wrap].max

    # puts "max_local: #{max_local}"
    # puts "max_wrap: #{max_wrap}"
    # puts "max: #{max}"
  end

  max
end

class MaximumSubarraySum < Minitest::Test
  def test_solution1_scenario1
    input = [34, -50, 42, 14, -5, 86]
    expected = 137

    assert_equal expected, solution1(input)
  end

  def test_solution1_scenario2
    input = [-5, -1, -8, -9]
    expected = 0

    assert_equal expected, solution1(input)
  end

  #

  def test_solution2_scenario1
    input = [34, -50, 42, 14, -5, 86]
    expected = 137

    assert_equal expected, solution2(input)
  end

  def test_solution2_scenario2
    input = [-5, -1, -8, -9]
    expected = 0

    assert_equal expected, solution2(input)
  end

  #

  def test_solution_1_wrap_scenario1
    input = [8, -1, 3, 4]
    expected = 15

    assert_equal expected, solution1_wrap(input)
  end

  def test_solution_1_wrap_scenario1
    input = [8, -1, 8, -9, 3, 4]
    expected = 16

    assert_equal expected, solution1_wrap(input)
  end
end
