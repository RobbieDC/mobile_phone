require("minitest/autorun")
require_relative("../mobile")

class TestMobile < MiniTest::Test

  def setup
    @nokia = MobilePhone.new(10, 100)
  end

  def test_has_credit
    assert_equal(10, @nokia.credit)
  end

  def test_decrease_credit
    @nokia.decrease_credit(1)
    assert_equal(9, @nokia.credit)
  end

  def test_decrease_power
    @nokia.decrease_power(10)
    assert_equal(90, @nokia.power)
  end

  def test_increase_credit
    @nokia.increase_credit(1)
    assert_equal(11, @nokia.credit)
  end

  def test_increase_power
    @nokia.increase_power(10)
    assert_equal(110, @nokia.power)
  end

  def test_charge__basic
    @nokia.decrease_power(10)
    @nokia.charge(20)
    assert_equal(100, @nokia.power)
  end

  def test_charge__already_at_full_power
    charge_result = @nokia.charge(40)
    assert_equal("Phone fully charged", charge_result)
  end

  def test_charege__stop_at_100
    @nokia.decrease_power(10)
    @nokia.charge(30)
    assert_equal(100, @nokia.power)
  end

  def test_top_up
    @nokia.top_up(2)
    assert_equal(12, @nokia.credit)
  end

  def test_call
    @nokia.call(20)
    credit_power = [@nokia.credit, @nokia.power]
    assert_equal([5, 40], credit_power)
  end

  def test_call__no_power
    @nokia.decrease_power(100)
    assert_equal("You have 0 power, please charge phone", @nokia.call(10))
  end

  def test_call__no_credit
    @nokia.decrease_credit(10)
    assert_equal("You have 0 credit, please top up", @nokia.call(10))
  end

  def test_call__not_enough_power
    @nokia.decrease_power(90)
    assert_equal("Not enough power to make this length of call", @nokia.call(5))
  end

  def test_call__not_enough_credit
    @nokia.decrease_credit(9)
    assert_equal("Not enough credit to make this length of call", @nokia.call(5))
  end

  def test_text

end