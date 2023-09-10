require_relative "stats"
require "test/unit"

class TestMain < Test::Unit::TestCase
  def test_total
    assert_equal(17, total([3, 4, 10]))
  end

  def test_mean
    assert_in_delta(5.666, mean([3,4,10]), 0.01)
  end

  def test_std_dev
    assert_in_delta(3.09, std_dev([3,4,10]), 0.01)
  end

  def test_median_odd
    assert_equal(4, median([3, 4, 10]))
  end

  def test_median_even
    assert_equal(7, median([3,4,10,15]))
  end
end