##### print numbers divisible by 3 , divisible by 5 , not 3*5=15
### taking numbers from 1-100
#!/bin/bash
##############################
#Author : Duryab
#Date  : 25/12/2024
#Version : v1
#############################

for i in {1..100}; do
if (['expr $i%2' == 0] ||['expr $i %5' == 0 ]) &&['expr $i%15' !=0];
then 
    echo $i
fi;
done
