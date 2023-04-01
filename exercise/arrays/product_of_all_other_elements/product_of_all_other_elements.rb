# frozen_string_literal: true

require 'minitest/autorun'

# v1
def poaoe_v1(input)
  result = [1] * input.size
  input.each.with_index do |value, index|
    result.size.times do |r_index|
      result[r_index] *= value if index != r_index
    end
  end
  result
end

# v2
def poaoe_v2(input)
  prefix = []
  suffix = []
  input.size.times do |index|
    prefix[index] = input[index]
    prefix[index] *= prefix[index - 1] if index > 0

    reverse_index = input.size - 1 - index
    suffix[reverse_index] = input[reverse_index]
    suffix[reverse_index] *= suffix[reverse_index + 1] if reverse_index < input.size - 1
  end

  result = []
  input.size.times do |index|
    result[index] = 1
    result[index] *= prefix[index - 1] if index > 0
    result[index] *= suffix[index + 1] if index < input.size - 1
  end

  result
end

class TestProductOfAllOtherElements < Minitest::Test
  def test_v1_scenario1
    input = [1, 2, 3, 4, 5]
    expected = [120, 60, 40, 30, 24]

    assert_equal expected, poaoe_v1(input)
  end

  def test_v1_scenario2
    input = [3, 2, 1]
    expected = [2, 3, 6]

    assert_equal expected, poaoe_v1(input)
  end

  def test_v1_scenario3
    input = [3, 2, 1, 0, 1, 2, 3]
    expected = [0, 0, 0, 36, 0, 0, 0]

    assert_equal expected, poaoe_v1(input)
  end

  def test_v2_scenario1
    input = [1, 2, 3, 4, 5]
    expected = [120, 60, 40, 30, 24]

    assert_equal expected, poaoe_v2(input)
  end

  def test_v2_scenario2
    input = [3, 2, 1]
    expected = [2, 3, 6]

    assert_equal expected, poaoe_v2(input)
  end

  def test_v2_scenario3
    input = [3, 2, 1, 0, 1, 2, 3]
    expected = [0, 0, 0, 36, 0, 0, 0]

    assert_equal expected, poaoe_v2(input)
  end
end
