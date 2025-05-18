# Shell script:
Shell script are series of commands in a file to automate tasks in a Unix/Linux shell. These scripts are executed by a shell interpreter (such as Bash, Zsh, or Sh) and can perform various operations like file manipulation, program execution, and system administration.

### Why Use Shell Scripting?
- Automation – Reduces manual work by automating repetitive tasks.

- Efficiency – Speeds up processes by executing multiple commands in sequence.

- Customization – Allows users to tailor system behavior to their needs.

- System Administration – Helps manage users, processes, and system configurations.

**Basic Structure of a Shell Script**

A shell script typically consists of:

- Shebang (#!) – Specifies the interpreter (e.g., Bash).

- Commands – Shell commands and logic.

- Variables – Store and manipulate data.

- Control Structures – Loops (for, while), conditionals (if, case).

- Functions – Reusable blocks of code.

### Automated Git Installation Script for Linux & Mac

`get-install.sh`
```
#!/bin/bash

echo "Scrip to install git"
echo "Installaiton started"
if [ "$(uname)" == "Linux" ];then
        echo "This is a linux machine"
        sudo apt install git -y
elif [ "$(uname)" == "Darwin" ];then
        echo "This is not linux machine"
        echo "This is Mac"
        brew install git
else
        echo "Not installing"
fi

```

### Disk Space Utilizaiton

`disk-space.sh`
```
#!/bin/bash

echo "Checking Disk usage in Linux System"
disk_size=` df -h | grep /dev/root | awk '{print $5}' | cut -d '%' -f1`
echo "$disk_size% of disk is filled"
if [ $disk_size -gt 80 ];then
        echo "Disk is utillized more than 80%, ecpand disk or delete files soon"
else
        echo "Enouh disk is avaliable"
fi


```

### Fetch Big files using Positional Arguments 

```
#!/bin/bash
echo " This program get first 5 biggest file in the file system passes via positional argument"
path="$1"
echo $path
du -ah $path | sort -hr | head -n 5 > /tmp/filesize.txt
echo "This is the list of big files in the file system $path"
cat /tmp/filesize.txt

```

### Delete files which are older than 30 days


To run this it needs path argument `./deletelogs.sh /home/ubuntu/`

```
#!/bin/bash
echo "This script delete files which are older than 30 days"
path="$1"
echo $path
find $path -mtime +30 -delete
if [[ $? -eq 0 ]]; then
        echo "Files are successfully deleted"
else
        echo "Deletion was having some issue"
fi

```

### Install prometheus software using wget

`shell-wget.sh`
```
#!/bin/bash
echo "Download the prometheus binaries"
if [ -e /home/ubuntu/prometheus-3.3.1.linux-amd64.tar.gz ]; then
        echo "file is already existing so no need to download"
else
        echo "binary does not exists in system first we need to downlad it"
        wget https://github.com/prometheus/prometheus/releases/download/v3.3.1/prometheus-3.3.1.linux-amd64.tar.gz
        tar -zxvf /home/ubuntu/prometheus-3.3.1.linux-amd64.tar.gz
        echo "file has been extracted you can start prometheus"
fi

```

### loop to remove a specific directory
`del_test_file.sh`

```
#!/bin/bash
name="test"
for folder in $( find . -type d ); do  # -type f: for file
        echo "the folder is $folder"
        if [ -d "$name" ]; then
                echo " this folder exists"
                echo " removing the folder "
                rm -rf test
        else
                echo "test folder does not exists"
        fi
done
~


```
### Check an appliction is runing on mahcine using cut command

`docker_service_check.sh`
```
#!/bin/bash
echo "===Status check docker service==="
status="`systemctl status docker | awk 'NR==3 {print}' | cut -d ':' -f 2 | cut -d '(' -f 1  `"
echo $status
if [ $status = "active" ]; then
        echo "service is running fine"
else
      
```


### Cron-tab mannagment in Linux
check if the service is runing after regural intervals if not then install it

coron job listing command 
```
crontab -l
```
to edit cron-job 
```
crontab -e
```
Now 

```

* * * * * /home/ubuntu/docker_service_check.sh >> logs.txt

```

to check if the docker is runing in cron-job.if not start the service

```
#!/bin/bash
echo "===Status check docker service==="
status="`systemctl status docker | awk 'NR==3 {print}' | cut -d ':' -f 2 | cut -d '(' -f 1  `"
echo $status
if [ $status = "active" ]; then
        echo "service is running fine"
else
        echo "service wass not running"
        sudo systemctl start docker
        echo "service is now running"
fi

```

### Bash Read

![image](https://github.com/user-attachments/assets/cab644ba-e78e-42de-a4eb-1cefd7dc70b7)

Example script:
```
#!/bin/bash
read -p "what is your name:" name
read -p "Enter the password:" -s pasword
echo $name
echo $password
read -p "it will timeout in 10 seconds:" -t 10

```

Read the service name from user and return its stauts. Is it runing or not 

```
#!/bin/bash
echo " Welcom to service status check script "
read -p " Enter the service name to check its status: " service_name
if [ -z $service_name ]; then
        echo "Please enter the valid service name"
else
        systemctl status $service_name   # systemctl list-unit-files to print all services
fi

```

### Check errors in error logs using grep

grep -option
![image](https://github.com/user-attachments/assets/ec568abb-f9aa-48b1-ac78-1d7e44831499)

Printing error log messages 

```
#!/bin/bash
error_file=`cat /var/log/syslog`
matched_error=`grep -i error /var/log/syslog`
if [[ $? -eq 0 ]]; then
        echo "Found error in OS logs: $matched_error"
else
        echo "No error in message logs"
fi

```

### Calculator using case


```
#!/bin/bash
clear
echo "--------------------------------"
echo "---------Calculator-------------"
echo "--------------------------------"
echo -e "[a]Addition\n[b]Substraction\n[c]Multiplication\n[d]Dvision\n"
read -p "Enter your choice:" choice
case $choice in
        [aA])
                read -p "Enter first number : " num1
                read -p "Enter 2nd number : " num2
                result=$((num1+num2))
                echo "The result is : $result"
                ;;
        [bB])
                read -p "Enter first number : " num1
                read -p "Enter 2nd number : " num2
                result=$((num1-num2))
                echo "The result is : $result"
                ;;
        [cC])
                read -p "Enter first number : " num1
                read -p "Enter 2nd number : " num2
                result=$((num1*num2))
                echo "The result is : $result"
                ;;
        [dD])
                read -p "Enter first number : " num1
                read -p "Enter 2nd number : " num2
                result=$(awk "BEGIN {print $num1 / $num2}")
                echo "The result is : $result"
                ;;
        *)
                echo "Wrong choice"
                ;;
esac

```


### Steam Editor ( SED )
-        This command can perform lot of funcitons without opening the file e.g view file contents, serching, find and replace insertion and deltion.
-        SED also supports regular expressions which allows it to perform complex pattern matching.
-    

 **Table summarizing common `sed` command usages** in Linux:

| **Command**                    | **Description**                                               | **Example**                         |
|--------------------------------|---------------------------------------------------------------|-------------------------------------|
| `sed 's/old/new/' file.txt`    | Replace **first occurrence** of "old" with "new" in each line | `sed 's/Linux/Unix/' file.txt`      |
| `sed 's/old/new/g' file.txt`   | Replace **all occurrences** of "old" with "new" in each line  | `sed 's/error/fixed/g' file.txt`    |
| `sed -i 's/old/new/g' file.txt`| Replace text **in-place** (modifies the file)                 | `sed -i 's/Linux/Unix/g' file.txt`  |
| `sed '/pattern/d' file.txt`    | Delete lines containing "pattern"                             | `sed '/error/d' file.txt`           |
| `sed -n 'p' file.txt`          | Print **All** file content                                    | `sed -n 'p' file.txt`               |
| `sed -n '5p' file.txt`         | Print **only** line 5                                         | `sed -n '5p' file.txt`              |
| `sed -n '5,10p' file.txt`      | Print lines **5 to 10**                                       | `sed -n '5,10p' file.txt`           |
| `sed '1i New line' file.txt`   | Insert "New line" **before** line 1                           | `sed '1i Header' file.txt`          |
| `sed '$a End line' file.txt`   | Append "End line" **after** last line                         | `sed '$a Footer' file.txt`          |
| `sed 's/^/Prefix: /' file.txt` | Add "Prefix: " **at the beginning** of each line              | `sed 's/^/Log: /' file.txt`         |
| `sed 's/$/ :Suffix/' file.txt` | Add " :Suffix" **at the end** of each line                    | `sed 's/$/ - Done/' file.txt`       |
| `sed -i '10i ------' file.txt` | **Inserts** "--------" **before** line 10                     | Adds a separator before line 10     |
| `sed -i '10a ------' file.txt` | **Appends** "--------" **after** line 10                      | Inserts a separator after line 10   |


### Checking Disk utilizaiton using funciton


```

#!/bin/bash
echo "Disk utlizaiton file"
disk_utilization() {
        disk=`df -h`
        echo "disk utilitation is : $disk"
}
if [[ $? -eq 0 ]]; then
        echo "This is the disk usage report"
        disk_utilization
else
        echo "disk has some issue"
fi

```

### Check if the server is rrunning

```

#!/bin/bash
#
echo "Check if the server is Running"
read -p "Enter the URL of server: " URL
response=$(curl -s -w "%{http_code}" $URL)
http1_code=$(tail -n1 <<< "$response")
content=$(sed '$ d' <<< "$response")

#echo "$http1_code"
if [ $http1_code == 200 ]; then
        echo "Request is working fine"
else
        echo "send slack message that request is denied"
fi

```

-        when you run the script it will ask the url. you have to put url in input.

### CPU Load Alert 

```#!/bin/bash
echo "CPU Load average value check"

# Extract CPU load correctly
load=$(top -bn1 | grep "load average" | awk '{print $10}' | tr -d ',')

echo "Current CPU Load: $load"

# Use `bc` for proper floating-point comparison
if (( $(echo "$load >= 1" | bc -l) )); then
    echo "CPU load is very high: $load"
else
    echo "CPU load is normal"
fi

```

### Backup automation

**Make sure:** you modify the directoy path according to usr systme.

```
#!/bin/bash
echo "Taking Backup of home and etc directories"

backup_dirs=("../../etc" "../../home")
dest_dir="/backup_today"
tmp_dir="../../tmp"
sudo mkdir -p $dest_dir
backup_date=$(date +%b-%d-%y)
echo "starting backup of: ${backup_dirs[@]}"

for i in "${backup_dirs[@]}"; do
        sudo tar -Pczf $tmp_dir/$i-$backup_date.tar.gz $i
        if [ $? -eq 0 ]; then
                echo "$i backup Succeeded."
        else
                echo "$i backup Failed."
        fi

        sudo cp $tmp_dir/$i-$backup_date.tar.gz $dest_dir
        if [ $? -eq 0 ]; then
                echo "$i transfer succeeded."
        else
                echo "$i transfer failed"
        fi
done
sudo rm $tmp/*.gz
echo "Backup is done"


```
### Create a Service to monitor disk utlization

A **service in Linux** is a background process managed by the operating system, typically started during boot and running continuously to perform specific tasks (e.g., networking, logging, monitoring).

Services are managed by **init systems** like **systemd**, using commands such as `systemctl start`, `stop`, `status`, and `enable`.

The key components of writing a **systemd service file** in Linux are:

1. **`[Unit]`** – Describes the service and its dependencies (e.g., `Description=`, `After=`).
2. **`[Service]`** – Defines how the service runs (e.g., `ExecStart=`, `User=`, `Restart=`, `Type=`).
3. **`[Install]`** – Specifies when the service should start (e.g., `WantedBy=multi-user.target`).

First write the task that you want to run as service:
Here my task file is `disk_monitor.sh` in home/ubuntu directory. Make it executable.

```
#!/bin/bash
# The script check system disk utilizatio after every 120 seconds and save into a txt file.
while true
do
        date >> /var/log/fs-monitor.txt
        df -h >> /var/log/fs-monitor.txt
        sleep 120
done

```
then write a service file in directory /etc/systemd/system by sudo previlage.

`sudo vi /etc/systemd/system/fs-monitor.service`


```
[Unit]
Description=FS monitoring Service
Documentation=https://devopstech.com

[Service]
Type=simple
User=root
Group=root
TimeoutStartSec=0
Restart=on-failure
RestartSec=30s
ExecStart=/home/ubuntu/disk_monitor.sh
SyslogIdentifier=Diskutilization


[Install]
WantedBy=multi-user.target

```

To Reloaded the updated configuration in system you need to first run 

```
sudo systemctl daemon-reload
```

To start the service 

```
sudo systemctl start fs-monitor.service

```
To check the status 

```

systemctl status fs-monitor.service

```

To check the file that has the ouput of disk utilization `cat /var/log/fs-monitor.txt`
