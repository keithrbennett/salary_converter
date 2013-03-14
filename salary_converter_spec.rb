require 'rspec'
require_relative 'salary_converter'

describe SalaryConverter do

  subject { SalaryConverter.new }
  
  it "should return 66.49 for a $100K salary" do
    subject.hourly_rate(100_000).should be_within(0.1).of(66.49)
  end
  
  it "should return 100_000 for a $66.49 hourly rate" do
    subject.annual_salary(66.48936170212765).should be_within(0.1).of(100_000.0)
  end
  
end

