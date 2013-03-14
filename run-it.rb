# Script to run the salary converter.

require_relative 'salary_converter'


puts("Hourly    Annual\n\n")

(50..100).each do |hourly_rate|
  annual_salary = SalaryConverter.new.annual_salary(hourly_rate)
  printf("%6d  %8d\n" % [hourly_rate, annual_salary])
end

=begin

Produces:

Hourly    Annual

    50     75200
    51     76704
    52     78208
    53     79712
    54     81216
    55     82720
    56     84224
    57     85728
    58     87232
    59     88736
    60     90240
    61     91744
    62     93248
    63     94752
    64     96256
    65     97760
    66     99264
    67    100768
    68    102272
    69    103776
    70    105280
    71    106784
    72    108288
    73    109792
    74    111296
    75    112800
    76    114304
    77    115808
    78    117312
    79    118816
    80    120320
    81    121824
    82    123328
    83    124832
    84    126336
    85    127840
    86    129344
    87    130848
    88    132352
    89    133856
    90    135360
    91    136864
    92    138368
    93    139872
    94    141376
    95    142880
    96    144384
    97    145888
    98    147392
    99    148896
   100    150400
   
   =end
   