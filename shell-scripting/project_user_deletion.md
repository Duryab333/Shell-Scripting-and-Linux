# 🗑️ User Account Removal Script (`del_user.sh`)
This Bash script automates the **4-step process** for safely removing a user account from a Linux system.  
It performs the following actions:
1️⃣ **Validates the username**, ensuring it exists in the system  
2️⃣ **Checks for running processes**, allowing the user to terminate them  
3️⃣ **Generates a report of files owned** by the account for review  
4️⃣ **Removes the user account**, ensuring no orphaned processes remain  

🔹 **Usage:** Run the script with `bash del_user.sh` and follow the prompts  
🔹 **Security:** Includes safeguards to prevent accidental deletions  
🔹 **Interactive:** Allows up to **three retries** for incorrect usernames  

✅ Designed for **system administrators**, **DevOps engineers**, or anyone managing Linux user accounts! 🚀  

```
#!/bin/bash
############################
# This script will automates the 4 steps to remove an account
#
# #########################
# Defining Funciton
# #########################
#
function get_answer(){
        unset answer
        ask_count=0
        while [ -z "$answer" ]; do
                ask_count=$(($ask_count+1))
                echo $ask_count

                case $ask_count in
                        2)
                                echo "Please answer the qestion"
                        ;;
                        3)
                                echo
                                echo "One Last Try... Please answer the question"
                                echo
                        ;;
                        4)
                                echo
                                echo "Since you refuse to answer the question"
                                echo "Exiting the Script"
                                echo
                                exit
                        ;;
                esac
                if [ -n "$line2" ]; then
                        echo $line1
                        echo -e $line2" \c"
                fi
                # Allow 60 seconds to answer before timeout
                read -t 60 answer
        done
        unset line1
        unset line2

}
function process_answer(){
        answer=$(echo $answer | cut -c1)
        case $answer in
                Y|y)
                        #if the answer is yes then do nothing
                ;;
                *)
                        echo
                        echo $exit_line1
                        echo $exit_line2
                        echo
                        exit
                ;;
        esac
        unset exit_line1
        unset exit_line2

}

function user_exists() {
        attempt_count=0
        while [ "$attempt_count" -lt 3 ]; do
                if getent passwd "$user_account" > /dev/null; then
                        echo "User '$user_account' exists in the system."
                        return 0
                else
                        attempt_count=$(($attempt_count+1))
                        if [ "$attempt_count" -eq 3 ]; then
                                echo "The usercount is not correct even 3rd time"
                                echo "Exiting the script..."
                                exit 1
                        fi
                        echo "User '$user_account' does NOT exist. Try again."
                        read -p "Enter a valid username: " user_account
                fi
        unset attempt_count
        done
}

###########################
#End of Funcito Definaiton
###########################
#
#
# Main Script
#
#
echo "Step #1 - Dertermine User Account name to Delete"
echo
line1="Please enter the username of the account: "
line2="you wish to Delete from system"
get_answer
user_account=$answer
user_exists
#
#Double check with script user that is the correct user Account
#
line1="Is $user_account the correct user account"
line2="you widh to delete from the system? [y/n]: "
get_answer
exit_line1="Because the account, $user_account, is not"
exit_line2="The one you wish to delete, we are leaving the script..."
process_answer

###################
#search for any runing process(es) that belong to the user account
echo
echo "Step #2 - Find process on system belonging to user account"
echo
ps -u $user_account> ../../dev/null  #List user process(es) running.
case $? in
        1)
                # no process running for this User Account
                echo "There are no processes for htis account currently running."
                echo
        ;;
        0)
                echo "$user_account has the following process(es) running"
                ps -u $user_account
                line1="Would you like me to kill the process(es)? [Y/n]: "
                get_answer
                answer=$(echo $answer | cut -c1)
                case $answer in
                        y|Y)
                                echo
                                echo "Killing of Proces(es)..."
                                command_1="ps -u $user_account --no-heading"
                                command_3="xargs -d '\n' sudo kill -9"
                                $command_1 | gawk '{print $1}' | $command_3
                                echo
                                echo "Peocess(es) Killed."
                        ;;
                        *)
                                echo
                        ;;
                esac
        ;;
esac
echo
echo "Step #3 - Find files on system belinging to user Account"
echo
echo "Creating a report of all files owned by $user_account."
echo
echo "It is recommended that you backup/archieve these files,"
echo "1) Delete the file"
echo "2) Change the files ownership to a current user account."
echo
echo "Please wait. This may take a while."
#
report_date=$(date +%y%m%d)
report_file="$user_account"_Files_"$report_date".rpt
sudo find / -user $user_account> $report_file 2>/dev/null

echo
echo "Report is complete."
echo "Name of report:   $report_file"
echo -n "Locaiton of report:"; pwd
echo


####################
#Remove user Account
echo
echo "Step #4 - Remove user account"
echo
line1="Do you want to remove $user_account`s account form system? [Y/n] :"
get_answer
exit_line1="Since yo do not wish to remove the user account,"
exit_line2="$user_account at this time, exiting the script...."
process_answer
sudo userdel $user_account
echo
echo "User Account $user_account has been removed"
echo
exit

```
