---
layout: default
---

# Git Basics and Commands
SHA: The 40 digit hash number that verifies data integrity for a commit\
HEAD: A pointer; always points to tip of currently checked out branch\
Git commands are prefaced with the word ‘git’: git add, git delete, git diff, etc.

## Global Configurations
From any place in the command line, type\
Git config --global user.name “daisytrench”\
Git config --global user.email ‘catherine.snider@colorado.edu’\
git config --global color.ui true (color the user interface)\
git config --list (will display the config that you have already set)\

## Remote repository
git remote (show origin: (shows the origin URL, branches and other info)\
git fetch: (pulls changes from the origin-master branch)\
git pull: (does a git fetch followed by a git merge)\
git push: (pushes committed changed up to remote)\
git branch -r (shows remote branches)\

## Branches
A new branch is created off of the current branch.\
git branch: (shows branches; highlights the currently checked out branch)\
git checkout <branchname> (switches HEAD to an existing branch)\
git checkout -b <branchname> (creates a new branch and switches HEAD to it at the same time)\
git branch -a (shows local and remote branches)\
git branch -d branchNameHere (deletes named branch if it's been merged)\
git branch -D branchNameHere (deletes named branch even if not merged)\
git branch --merged (shows the branches that have been merged)\
git branch --no-merge (shows branches that haven't been merged)\

### Merging Branches
Be on the receiver branch, i.e. the one into which you are merging.  You pull in the changes from the other branch. Then merge:\
git merge <branch-to-merge>

### Branch Stats
Git status: reports the difference between the working directory, the staging index and the repository\
git log (shows all commits with SHAs and commit message, latest to earliest)\
git log -n 3 (show me the last three commits)\
git log --oneline (easier to read)\
git log --since=2015-01-01 (everything since given date)\

## Staging and Committing
Add changed file(s) to staging area:\
git add .\
git add <filename>\

git commit -m "[As the project drags on](https://xkcd.com/1296/)"

## Undoing Mess-ups
git Reset: specifies where the head pointer should point. Very powerful and can undo a bunch of work that maybe you didn't mean to.
* --soft (leaves staging and working in their later revised state; you'll need to do a merge. The git repository will be reset to an earlier version. Do a Git Diff to see the difference.)
* --mixed (default; moves head to earlier commit; changes staging index to match repository; does not change working directory. We have not lost any work. Do a Git Diff to see the difference.)
* --hard (destructive; moves pointer of repository; makes staging and working directory match repository. You'll lose all work since the last commit. Sometimes you want that.)
