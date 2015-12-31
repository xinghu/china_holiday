require "minitest/autorun"
require '../lib/china_holiday.rb'

class HolidayTest < Minitest::Test

  def test_weekend
    week_end = Date.parse('2015-12-19')
    assert_equal true, ChinaHoliday.weekend?(week_end)
  end

  def test_not_weekend
    not_week_end = Date.parse('2015-12-21')
    assert_equal false, ChinaHoliday.weekend?(not_week_end)
  end

  def test_holiday
    holiday = Date.parse('2016-1-1')
    assert_equal true, ChinaHoliday.holiday?(holiday)
  end

  def test_not_holiday
    not_holiday = Date.parse('2016-1-4')
    assert_equal false, ChinaHoliday.holiday?(not_holiday)
  end

end
