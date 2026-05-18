#!/bin/bash

# =====================================================
# Service Monitoring and Management Script
#
# Features:
# - Check service status
# - Start / Stop / Restart service
# - Auto restart inactive service
# - Send email alert if restart fails
#
# Usage:
# ./service_check.sh
# ====================================================

read -p "Enter the serice name: " service_name
if [ -z "$service_name" ]; then
        echo "Service name cannot be empty"
        exit 1
fi

function service_check {
        local service_exists
        service_exists=$(systemctl list-unit-files | grep "^${service_name}.service")

        if [ -z "$service_exists" ]; then
                echo "Service '$service_name' not found"
                exit 1
        fi

        local status
        status=$(systemctl is-active "$service_name")
        echo "-----------------------------"
        echo "Service Name   :  $service_name"
        echo "Service Status :  $status"
        echo "-----------------------------"
}
function service_options {
        echo ""
        echo "Chose an option: "
        echo "1 - Start Service"
        echo "2 - Stop Service"
        echo "3 - Restart Service"
        echo "4 - exit Service"
        read -p "Enter your choce: " choice

        case $choice in
                "1")
                        echo "Starting Service...."
                        sudo systemctl start $service_name > /dev/null
                        if [ $? -eq 0 ]; then
                                echo "Service Started Successfully"

                        else
                                echo "Failed to start service"
                        fi
                        ;;
                "2")
                       echo "Stoping Service...."
                        sudo systemctl stop $service_name > /dev/null
                        if [ $? -eq 0 ]; then
                                echo "Service Stoped Successfully"
                        else
                                echo "Failed to stop service"

                        fi
                        ;;
                "3")
                        echo "Restaring Service...."
                        sudo systemctl restart $service_name > /dev/null
                        if [ $? -eq 0 ]; then
                                echo "Service Restarted Successfully"
                        else
                                echo "Failed to restart service"
                        fi
                        ;;
                "4")
                        echo "Exiting Program ..."
                        exit 0
                        ;;
                *) echo "Invalid choice "
                        ;;
        esac
}
function auto_restart_service {
        local notify_mail=duryabphone@gmail.com
        #local service="nginx"
        read -p "enter service you want to check: " service

        local service_exists
        service_exists=$(systemctl list-unit-files | grep "^${service}.service")

        if [ -z "$service_exists" ]; then
                echo "Service '$service' not found"
                exit 1
        fi
        local service_status=$(systemctl is-active $service)
        if [ "$service_status" != "active" ]; then
                echo "$service is down. Restarting service... "
                sudo systemctl restart "$service" > /dev/null 2>&1
                local new_status=$(systemctl is-active "$service")
                if [ "$new_status" == "active" ]; then
                        echo "$service restarted sucessfully"
                else
                        echo "$service restart failed"
                        echo "$service service is Down Alert" | mail -s "Test Alert" "$notify_mail"
                fi
        fi



}


service_check
service_options
auto_restart_service
