require 'date'
require 'yaml'

class ChinaHoliday
  def self.weekend?(date)
    date.cwday == 6 || date.cwday == 7
  end
  #weekend or holiday
  def self.holiday?(date)
    yaml = YAML.load_file(File.expand_path('../../holidays.yml', __FILE__))
    self.weekend?(date) || yaml.keys.include?(date)
  end

  #last work day previous given self
  def self.last_work_day(date)
    wday = date.cwday
    friday = date.friday? ? date : date+(5-wday)

    return self.last_day(friday)
  end

  def self.last_work_day?(date)
    #code
    last_work_self = self.last_work_day(date)
    last_work_self == date ? true : false
  end

  def self.last_day(date)
    if self.holiday?(date)
      self.last_day(date-1)
    else
      return date
    end
  end
end
