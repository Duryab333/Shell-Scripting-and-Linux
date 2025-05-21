# Shell Scripting Basics for DevOps

## Overview of Shell Script Execution

### Shebang (`#!`) and Executables
- These are the interpreters used to execute shell scripts.
```bash
#!/bin/ksh, bash, sh, dash
```

### Executing Shell Scripts

- To execute a file, use `sh` or `./` before the filename.

```bash
sh or ./
```

### Printing Output
- Used to print output to the terminal.
```bash
echo
```
### File Permissions
- `chmod` changes file permissions to control who can read, write, or execute the file.

### Permission Levels
- **1st**: Permissions for the root user.
- **2nd**: Permissions for the group.
- **3rd**: Permissions for others (all users).

### Permission Values
- `7`: Full permissions (read, write, execute).
- `4`: Read.
- `2`: Write.
- `1`: Execute.

Example:
```bash
chmod 777 file
```
- Grants full permissions to the owner, group, and others.
### Add a New User

```
sudo adduser your_username

```
with sudo previligeous:

```
sudo usermod -aG sudo your_username

```



## Purpose of Shell Scripting in DevOps

### DevOps Engineering Tasks
- **Infrastructure Management**
- **Configuration Management**
- **Code Management** (e.g., using Git repositories with Linux)

## Best Practices for Writing Shell Scripts

1. **Metadata**
   - Always include metadata at the beginning of the script.
2. **Debug Mode**
   - Run scripts in debug mode using `set -x` to trace commands.
3. **Exit on Error**
   - Use `set -e` to ensure the script exits immediately if any command fails.
4. **Pipefail**
   - Use `set -o pipefail` to ensure the script exits if any command in a pipeline fails.

