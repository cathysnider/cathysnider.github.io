---
layout: default
---

# Working with Repositories

## Create a New Local Repository

Two ways: by cloning someone else's work or using your own

1. Cloning an existing GitHub repository:\
get the clone URL from GitHub\
From command line, in parent directory:\
git clone {cloneURL}\
The new directory is initialized as a git repo and is connected to the remote origin\

1. Using your own work:\
a) Initialize the project directory as a Git Repository\
In root of directory you want to start tracking:\
echo "# MyRepoName" >> README.md\
git init\
touch .gitignore (creates an empty .gitignore file in root of project directory)\
add any binary files to the .gitignore file"\
echo "/images/wildcard" >> .gitignore\
Screw up the GitIgnore at your peril.\

b) Commit everything to the repository
git add .\
Remove any binary files from the staging area and add them to .gitignore\
(QUESTION: How to remove something from staging before initial commit?)\
git commit -m 'initiating repository'\

c) Connect new local repo to a remote repo on GitHub
The repository must exist on GitHub\
Go to GitHub and create the repository; copy its URL\
git remote add origin https://github.com/cathysnider/myNewRepo.git\
git push -u origin master\
