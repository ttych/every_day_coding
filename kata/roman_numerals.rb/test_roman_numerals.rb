require 'minitest/autorun'

class Integer
  def to_roman
    return nil if self < 1
    return nil if self > 4999

    roman_map = {
      1000 => 'M',
      900 => 'CM',
      500 => 'D',
      400 => 'CD',
      100 => 'C',
      90 => 'XC',
      50 => 'L',
      40 => 'XL',
      10 => 'X',
      9 => 'IX',
      5 => 'V',
      4 => 'IV',
      1 => 'I',
    }

    roman_i = self
    roman = ''

    roman_map.each do |number, number_roman|
      while roman_i >= number
        roman << number_roman
        roman_i -= number
      end
    end

    # if roman_i >= 50
    #   roman << 'L'
    #   roman_i -= 50
    # end
    # if roman_i >= 40
    #   roman << 'XL'
    #   roman_i -= 40
    # end
    # while roman_i >= 10
    #   roman << 'X'
    #   roman_i -= 10
    # end
    # if roman_i >= 9
    #   roman << 'IX'
    #   roman_i -= 9
    # end
    # if roman_i >= 5
    #   roman << 'V'
    #   roman_i -= 5
    # end
    # if roman_i >= 4
    #   roman << 'IV'
    #   roman_i -= 4
    # end
    # roman << 'I' * roman_i

    roman
  end
end

class TestRomanNumerals < Minitest::Test
  def test_cannot_convert_0
    assert_nil 0.to_roman
  end

  def test_cannot_convert_4000
    assert_nil 5000.to_roman
  end

  def test_can_convert_1
    assert_equal 'I', 1.to_roman
  end

  def test_can_convert_2
    assert_equal 'II', 2.to_roman
  end

  def test_can_convert_3
    assert_equal 'III', 3.to_roman
  end

  def test_can_convert_5
    assert_equal 'V', 5.to_roman
  end

  def test_can_convert_6
    assert_equal 'V', 5.to_roman
  end

  def test_can_convert_7
    assert_equal 'VI', 6.to_roman
  end

  def test_can_convert_8
    assert_equal 'VII', 7.to_roman
  end

  def test_can_convert_10
    assert_equal 'X', 10.to_roman
  end

  def test_can_convert_11
    assert_equal 'XI', 11.to_roman
  end

  def test_can_convert_12
    assert_equal 'XII', 12.to_roman
  end

  def test_can_convert_15
    assert_equal 'XV', 15.to_roman
  end

  def test_can_convert_16
    assert_equal 'XVI', 16.to_roman
  end

  def test_can_convert_18
    assert_equal 'XVIII', 18.to_roman
  end

  def test_can_convert_20
    assert_equal 'XX', 20.to_roman
  end

  def test_can_convert_27
    assert_equal 'XXVII', 27.to_roman
  end

  def test_can_convert_38
    assert_equal 'XXXVIII', 38.to_roman
  end

  def test_can_convert_50
    assert_equal 'L', 50.to_roman
  end

  def test_can_convert_68
    assert_equal 'LXVIII', 68.to_roman
  end

  def test_can_convert_4
    assert_equal 'IV', 4.to_roman
  end

  def test_can_convert_14
    assert_equal 'XIV', 14.to_roman
  end

  def test_can_convert_34
    assert_equal 'XXXIV', 34.to_roman
  end

  def test_can_convert_9
    assert_equal 'IX', 9.to_roman
  end

  def test_can_convert_39
    assert_equal 'XXXIX', 39.to_roman
  end

  def test_can_convert_50
    assert_equal 'L', 50.to_roman
  end

  def test_can_convert_40
    assert_equal 'XL', 40.to_roman
  end

  def test_can_convert_44
    assert_equal 'XLIV', 44.to_roman
  end

  def test_can_convert_49
    assert_equal 'XLIX', 49.to_roman
  end

  def test_can_convert_100
    assert_equal 'C', 100.to_roman
  end

  def test_can_convert_90
    assert_equal 'XC', 90.to_roman
  end

  def test_can_convert_94
    assert_equal 'XCIV', 94.to_roman
  end

  def test_can_convert_199
    assert_equal 'CXCIX', 199.to_roman
  end
end
