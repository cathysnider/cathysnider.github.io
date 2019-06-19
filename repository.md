---
title: Working with Repositories
layout: default
---

# Working with Repositories

### Create a New Local Repository

Two ways: by cloning someone else's work or using your own.

1. Cloning an existing GitHub repository: <br />
   * Get the clone URL from GitHub <br />
   * From command line, in parent directory: <br />
     `git clone {repositoryURL}` <br />
     The new directory is automatically initialized as a git repo and is connected to the remote origin <br />
1. Using your own work: <br />
   1. Initialize the project directory as a Git Repository <br />
      In root of directory you want to start tracking: <br />
      `git init` <br />
      `echo "# MyRepoName" >> README.md` <br />
      `touch .gitignore` (create empty .gitignore file in root of project directory) <br />
      Add any binary files to the .gitignore file <br />
      `echo "/images/*" >> .gitignore` <br />
      Several .gitignore recipes are available for Drupal 7: [CU-Boulder](https://github.com/CuBoulder/drupal-7.x/blob/7.x/.gitignore) or [jbudziak's](https://gist.github.com/jbudziak/4216850) for example.
      Screw up the GitIgnore at your peril.
   1. Commit everything to the repository <br />
      `git add .` <br />
      Remove any binary files from the staging area and add them to .gitignore <br />
      `git commit -m 'initiating repository` <br />
   1. Connect new local repo to a remote repo on GitHub <br />
      The repository must exist on GitHub <br />
      Go to GitHub and create the repository; copy its URL <br />
      `git remote add origin {repositoryURL}` <br />
      `git push -u origin master`


[back](./)
