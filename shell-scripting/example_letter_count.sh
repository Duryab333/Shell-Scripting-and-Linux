#!/bin/bash
###############
#Puropose :  print number of alphabet "s" present in x letter
###############

x=mississipi
grep -o "s" <<<"$x" | wc -l

