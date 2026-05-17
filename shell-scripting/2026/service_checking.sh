#!/bin/bash
#
#
#
<<comment
This script check for service status.If service is not runing, restart if

usage:
./service_check.sh
comment

read -p "Enter the serice name: " service_name

function service_check {

        service=$(systemctl list-units --type=service -all | grep "$service_name" | awk -F"." 'NR==1 {print $1}')
        len=$( echo -n $service | wc -c)

        if [  $len != 0 ]; then
                status=$(systemctl list-units --type=service -all | grep "$service_name" | awk '{print $3}')
                echo "Service Status: ${status}"
        else
                echo "$service_name Not found"
                exit 1
        fi
}
function service_options {
        echo ""
        echo "Do you want to do any of the following tasks: "
        echo "1-Start Service"
        echo "2-Stop Service"
        echo "3-Restart Service"
        echo "4-exit Service"
        read -p "Enter your choce: " choice
        case $choice in
                "1")
                        echo "Starting Service ....."
                        sudo systemctl start $service_name > /dev/null
                        if [ $? -eq 0 ]; then
                                echo "Service Started Successfully"
                        fi
                        ;;
                "2")
                       echo "Stoping Service ....."
                        sudo systemctl stop $service_name > /dev/null
                        if [ $? -eq 0 ]; then
                                echo "Service Stoped Successfully"
                        fi
                        ;;
                "3")
                        echo "Restaring Service ....."
                        sudo systemctl restart $service_name > /dev/null
                        if [ $? -eq 0 ]; then
                                echo "Service Restarted Successfully"
                        fi
                        ;;
                "4")
                        echo "Exiting Program ..."
                        exit 0
                        ;;
                *) echo "Invalid choice "
        esac
}

service_check
service_options
                                             
