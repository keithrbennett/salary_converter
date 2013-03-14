# Script to run the salary converter.

require_relative 'salary_converter'


puts("Hourly    Annual\n\n")

(50..100).each do |hourly_rate|
  annual_salary = SalaryConverter.new.annual_salary(hourly_rate)
  printf("%6d  %8d\n" % [hourly_rate, annual_salary])
end
