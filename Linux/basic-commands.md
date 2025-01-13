# Linux Basic Commands

Present working directory
```
pwd                    
```
Change direcory
```
cd
```                    
List element present directory
```
ls
```                   

List detials of  element in present directory
```
ls -ltr
```
Make file
```
touch  file_name                
```
To create and write in file. 'i' for insert then after writnting Esc ':wq!'
```
vi file_name                    
```

Print file inside
```
cat   file_name        
```
To make directory
```
mkdir directory_name   
```
To remove directory
```
rm -r directory_name   
```
To check how much memory is used or free
```
free, free -g          
```
No. Of CPUs 
```
nproc                  
```
Disk Size
```
df -h                  
```
Complete information of memory resources, how many processes are runing on machine and how much memory is used in them 
```
top                    
```
Get the process information that is runing on systm 
```
ps -ef                 
```
Filter some information form output 
```
grep                   
```
pipe command is used for get the output form first command and send to second command
```
|                      
```

In a Unix-like system, programs use three standard streams: `stdin` (standard input), `stdout` (standard output), and `stderr` (standard error). `stdin` is where a program reads its input, typically from the keyboard or another program's output in a pipeline. `stdout` is where the program writes its output, usually displayed in the terminal or passed to another command via a pipe (`|`). `stderr` is used for error messages and diagnostics, separate from `stdout`. When using pipes, only `stdout` is passed to the next command by default. To include error messages from `stderr` in the pipeline, you can redirect `stderr` to `stdout` using `2>&1`, ensuring all output flows through the pipe to the next command.

Output is “today is ” not with real date. Date is system default command. So it sends information to stdin and pipe is not be able to receive it
```
date | echo “today is ”                               
```
Used to print certain column from output 
```
awk -F “ ” ‘{print $2}’                                 
```
This will print the amazon process id
```
ps -ef | grep amazon | awk -F “ ” ‘{print $2}’          
```
Here will be log file loaded then by applying grep or | comand required output can be generated) e.g curl link.com | grep ERROR
```
curl   www.link-logfile.com                             
```
Downloads the log file on our system then to retrieve information e.g cat filename | grep ERROR  
```
wget link.com                                           
```
To switch to root user to write command which needs root credentials to run
```
sudo su -                                               
```
Find is use to search the file from the entire file systm
```
sudo find / -name filename        
```

