#! /usr/bin/env ruby

# Calculates the hourly consulting rate corresponding to an annual salary
# at a job that includes employer paid benefits.
#
# Default assumptions:
#   Paid Time Off is 5 weeks (3 weeks vacation, 10 holidays)
#   Employer benefits premium is 25% of salary

class SalaryConverter

  attr_accessor :employer_benefits_premium, :paid_time_off_week_count

  def initialize(
      employer_benefits_premium = 0.25,
      paid_time_off_week_count = 5)

    self.employer_benefits_premium = employer_benefits_premium
    self.paid_time_off_week_count = paid_time_off_week_count
  end
  
  # The number of hours worked for an employer in return
  # for the annual salary. Basically, 8 hours per weekday
  # for all weekdays not PTO (vacation/sick) days.
  def work_hours_per_year
    (52 - paid_time_off_week_count) * 40
  end

  # Factor representing (salary + benefits) / salary,
  # e.g. 1.25 where an employer provides benefits worth
  # 25% of the annual salary.
  def employee_cost_factor
    1 + employer_benefits_premium
  end

  # Annual salary equivalent to the specified hourly rate
  def annual_salary(hourly_rate)
    hourly_rate * work_hours_per_year / employee_cost_factor
  end

  # Hourly rate equivalent to the specified annual salary
  def hourly_rate(annual_salary)
    employee_cost_factor * annual_salary  / work_hours_per_year
  end
end

puts("Hourly    Annual\n\n")

(50..100).each do |hourly_rate|
  annual_salary = SalaryConverter.new.annual_salary(hourly_rate)
  printf("%6d  %8d\n" % [hourly_rate, annual_salary])
end
