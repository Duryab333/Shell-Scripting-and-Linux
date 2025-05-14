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

