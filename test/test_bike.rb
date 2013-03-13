require './lib/bike' # the class under test
require 'minitest/autorun' # the minitest itself
require 'ansi' # makes it colored
require 'turn' # improves the default output

class TestBike < MiniTest::Unit::TestCase

  def setup
    @bike = Bike.new
  end

  def test_bike_is_not_broken_by_default
    assert @bike.broken? == false
  end

  def test_bike_can_be_broken
    @bike.break!
    assert @bike.broken?
  end

  def test_bike_can_be_fixed
    @bike.fix!
    assert @bike.broken? == false
  end

private
  
  def helper
    raise "whatever"
  end

end