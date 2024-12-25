#################
#Author: Duryab
#Date : 25/12/2024
#
#This script ouputs the node health
#
#Version: v1
##################

set -x  # debug mode 
set -e  # exit the script when there is an error
set -o  # pipfail

df -h 
free -g
nproc
        #ps -ef  display detailed information about all the processes running on the system
        
ps -ef | grep amazin | awk -F " " '{print $2}'


