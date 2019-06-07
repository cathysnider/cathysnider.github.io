---
title: Working with Repositories
layout: default
---

# Working with Repositories

### Create a New Local Repository

Two ways: by cloning someone else's work or using your own.

1. Cloning an existing GitHub repository: <br />
   * get the clone URL from GitHub <br />
   * From command line, in parent directory: <br />
     `git clone {cloneURL}` <br />
     The new directory is initialized as a git repo and is connected to the remote origin <br />
1. Using your own work: <br />
   1. Initialize the project directory as a Git Repository <br />
      In root of directory you want to start tracking: <br />
      `git init` <br />
      `echo "# MyRepoName" >> README.md` <br />
      `touch .gitignore` (create empty .gitignore file in root of project directory) <br />
      add any binary files to the .gitignore file <br />
      `echo "/images/*" >> .gitignore` <br />
      Screw up the GitIgnore at your peril.
   1. Commit everything to the repository <br />
      `git add .` <br />
      Remove any binary files from the staging area and add them to .gitignore <br />
      `git commit -m 'initiating repository` <br />
   1. Connect new local repo to a remote repo on GitHub <br />
      The repository must exist on GitHub <br />
      Go to GitHub and create the repository; copy its URL <br />
      `git remote add origin https://github.com/cathysnider/myNewRepo.git` <br />
      `git push -u origin master`

[back](./)
