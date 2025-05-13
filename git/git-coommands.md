# Git Commands Sheet

## Initializing a Repository
```bash
git init
```
- Initializes a new Git repository.

## Adding and Committing Changes
```bash
git add file-name
git commit -m "message"
```
- Adds a file to the staging area and commits changes with a message.

## Viewing Logs
```bash
git log
git log --oneline
git log -branch_name
```
- `git log`: Displays all commit history with detailed information.
- `git log --oneline`: Displays a simplified commit history.
- `git log -branch_name`: Shows the log of a specific branch.

## Resetting and Viewing Differences
```bash
git reset commit-ID
git diff
```
- `git reset commit-ID`: Resets the current HEAD to the specified commit ID.
- `git diff`: Shows changes between the working directory and the index.

## Checking Repository Status
```bash
git status
```
- Displays the state of the working directory and staging area.

## Remote Repositories
```bash
git remote -v
git remote add --location_of_git_repository
git pull
git clone --https_link
git clone --ssh
git push origin HEAD:--branch_name

```
- `git remote -v`: Shows the URLs of remote repositories.
- `git remote add --location_of_git_repository`: Adds a new remote repository.
- `git pull`: Fetches and integrates changes from the remote repository.
- `git clone --https_link`: Clones a repository via HTTPS (requires credentials).
- `git clone --ssh`: Clones a repository via SSH (requires SSH key setup).
- `git push`: is push to the target branch on GitHub where your local commit will be pushed.
### Setting Up SSH Keys
```bash
ssh-keygen -t rsa
```
- Generates a new SSH key pair. Add the public key to GitHub:
  - Go to GitHub settings > SSH and GPG keys > New SSH key > Paste the content of `id_rsa.pub`.

## Branching and Switching Branches
```bash
git branch branch_name
git checkout -b branch_name
git checkout branch_name
```
- `git branch branch_name`: Creates a new branch.
- `git checkout -b branch_name`: Creates and switches to a new branch from the main branch.
- `git checkout branch_name`: Switches to the specified branch.

## Merging and Rebasing
```bash
git cherry-pick commit-ID
git merge branch_name
git rebase branch_name
```
- `git cherry-pick commit-ID`: Applies a commit from another branch to the current branch.
- `git merge branch_name`: Merges another branch into the current branch (non-linear history).
- `git rebase branch_name`: Reapplies commits on top of another branch, creating a linear history.

## Git configuraiton 

Use Git Credential Manager (Windows/Linux/Mac)
If you're on a personal machine and want Git to remember credentials:

```
git config --global credential.helper store
# or better
git config --global credential.helper cache
```
