---
title: Git and Git Hub
layout: default
---

## Best Practices: Git and GitHub

* [Datree.io: Top 10 GitHub best practices for developers](https://datree.io/github-best-practices/)
* [GitHub Resources: GitHub best practices](https://resources.github.com/videos/github-best-practices/)
* [Pandeiro: Git Best Practices](https://gist.github.com/pandeiro/1552496)

# Git Basics and Commands

* SHA: The 40 digit hash number that verifies data integrity for a commit<br />
* HEAD: A pointer; always points to tip of currently checked out branch<br />
* Git commands are prefaced with the word `git`: `git add`, `git delete`, `git diff`, etc.

## Global Configurations

From any place in the command line, type

```sh
git config --global user.name "daisytrench"
git config --global user.email "catherine.snider@colorado.edu"
git config --global color.ui tru # color the user interface
git config --list # will display the config that you have already set
```

## Remote repository

```sh
git branch -r # shows remote branches
git remote show origin # shows the remote repository URL, branches and other info
git fetch # pulls changes from the origin-master branch
git pull # does a git fetch followed by a git merge
git push # pushes committed changed up to remote
git push --set-upstream origin {branchName} # creates remote branch and pushes to it
git remote remove origin # disconnects from origin so you can do your Drupal lessons w/o messing up Express
```

## Branches

A new branch is created off of the current branch.<br />
```sh
git branch # shows branches; highlights the currently checked out branch
git checkout <branchname> # switches HEAD to an existing branch
git checkout -b <branchname> # creates a new branch and switches HEAD to it at the same time
git branch -a # shows local and remote branches
git branch -d branchNameHere # deletes named branch if it's been merged
git branch -D branchNameHere # deletes named branch even if not merged
git branch --merged # shows the branches that have been merged
git branch --no-merge # shows branches that haven't been merged
```

### Merging Branches
Be on the receiver branch, i.e. the one into which you are merging.  You pull in the changes from the other branch. Then merge: <br />
`git merge <branch-to-merge>`

### Branch Stats
```sh
git status # reports the difference between the working directory, the staging index and the repository
git log # shows all commits with SHAs and commit message, latest to earliest
git log -n 3 # show me the last three commits
git log --oneline # easier to read
git log --since=2015-01-01 # everything since given date
```

### Differences
`git diff` show file differences that **haven't been** staged
`git difftool` open the specified tool to view diffs

## Staging and Committing
Add changed files to staging area:<br />
`git add .`<br />
`git add <filename>`<br />

### Commit Messages
[How to Write Useful Commit Messages](https://dev.to/jacobherrington/how-to-write-useful-commit-messages-my-commit-message-template-20n9)

The template: <br />
```
Summarize the change in less than 50 characters

Because:
- Explain the reasons you made this change
- Make a new bullet for each reason
- Each line should be under 72 characters

Explain exactly what was done in this commit with more depth than the
50 character subject line. Remember to wrap at 72 characters!

```

`git commit -m "Explanatory Message"` <br />
[As the project drags on](https://xkcd.com/1296/)

## Undoing Mess-ups
```sh
git reset <last good SHA> # specifies where the head pointer should point. Very powerful and can undo a bunch of work that maybe you didn't mean to.
* --soft # leaves staging and working in their later revised state; you'll need to do a merge. The git repository will be reset to an earlier version. Do a Git Diff to see the difference.
* --mixed # default; moves head to earlier commit; changes staging index to match repository; does not change working directory. We have not lost any work. Do a Git Diff to see the difference.
* --hard # destructive; moves pointer of repository; makes staging and working directory match repository. You'll lose all work since the last commit. Sometimes you want that.
* --hard origin/master # nuke this thing: throw away all my staged and unstaged changes, forget everything on my current local branch and make it exactly the same as origin/master
```
# Working with Repositories

### Create a New Local Repository

Two ways: by cloning someone else's work or using your own.

1. **Cloning an existing GitHub repository:** <br />
   * Get the clone URL from GitHub <br />
   * From command line, in parent directory: <br />
     `git clone {repositoryURL}` <br />
     The new directory is automatically initialized as a git repo and is connected to the remote origin <br />
1. **Using your own work:** <br />
   1. **Initialize the project directory as a Git Repository** <br />
      In root of directory you want to start tracking: <br />
      `git init` <br />
      `echo "# MyRepoName" >> README.md` <br />
      `touch .gitignore` (create empty .gitignore file in root of project directory) <br />
      Add any binary files to the .gitignore file <br />
      `echo "/images/*" >> .gitignore` <br />
      Several .gitignore recipes are available for Drupal 7: [CU-Boulder's](https://github.com/CuBoulder/drupal-7.x/blob/7.x/.gitignore) or [jbudziak's](https://gist.github.com/jbudziak/4216850) for example. <br />
      Screw up the GitIgnore at your peril.
   1. **Add files to staging area** <br />
      `git add .` <br />
      Review the list. Remove any binary files from the staging area and add them to .gitignore <br />
      `git reset HEAD {filename}` (removes the one) or `git reset HEAD .` (just start over)
   1. **Commit everything to the respository**
      `git commit -m 'initiating repository`
   1. **Connect new local repo to a remote repo on GitHub** <br />
      The repository must exist on GitHub <br />
      Go to GitHub and create the repository; copy its URL <br />
      `git remote add origin {repositoryURL}` <br />
      `git push -u origin master`


[back](./)
