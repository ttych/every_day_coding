# frozen_string_literal: true

require 'minitest/autorun'

def solution1(input)
  sorted_input = input.sort

  a = 0
  b = input.size - 1
  input.size.times do |i|
    return [] if a >= b
    a += 1 if input[a] == sorted_input[a]
    b -= 1 if input[b] == sorted_input[b]
  end

  [a, b]
end

def solution2(input)
  sorted_input = input.sort

  a, b = nil, nil

  input.size.times do |i|
    if input[i] != sorted_input[i]
      a = i if a.nil?
      b = i
    end
  end

  [a, b]
end

def solution3(input)
  a,b = nil, nil
  max, min = nil, nil

  input.size.times do |i|
    r_i = input.size - i - 1

    max = [max, input[i]].compact.max
    b = i if input[i] < max

    min = [min, input[r_i]].compact.min
    a = r_i if input[r_i] > min
  end

  [a, b]
end

class TestSmallestWindowToBeSorted < Minitest::Test
  def test_solution1_scenario1
    input = [3, 7, 5, 6, 9]
    expected = [1, 3]

    assert_equal expected, solution1(input)
  end

  def test_solution1_scenario2
    input = [3, 7, 6, 5, 9]
    expected = [1, 3]

    assert_equal expected, solution1(input)
  end

  def test_solution1_scenario3
    input = [3, 6, 7, 5, 9]
    expected = [1, 3]

    assert_equal expected, solution1(input)
  end

  #

  def test_solution2_scenario1
    input = [3, 7, 5, 6, 9]
    expected = [1, 3]

    assert_equal expected, solution2(input)
  end

  def test_solution2_scenario2
    input = [3, 7, 6, 5, 9]
    expected = [1, 3]

    assert_equal expected, solution2(input)
  end

  def test_solution2_scenario3
    input = [3, 6, 7, 5, 9]
    expected = [1, 3]

    assert_equal expected, solution2(input)
  end

  #

  def test_solution3_scenario1
    input = [3, 7, 5, 6, 9]
    expected = [1, 3]

    assert_equal expected, solution3(input)
  end

  def test_solution3_scenario2
    input = [3, 7, 6, 5, 9]
    expected = [1, 3]

    assert_equal expected, solution3(input)
  end

  def test_solution3_scenario3
    input = [3, 6, 7, 5, 9]
    expected = [1, 3]

    assert_equal expected, solution3(input)
  end
end
