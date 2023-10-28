# Learning Git

## Motivation

We want to be able to work on the same project seamlessly, without having to pass manually versioned files back and forth or being limited to only one person actively editing a file at the same time. Git is a version control system that lets collaborators work together on the same codebase seamlessly. In a research context, having snapshots of past analyses and having an authoritative source of code is also important for ensuring reproducibility. Github is the most popular platform for hosting Git repositories, and HIP's repositories are hosted here.

## Setup

### Git/Github

Getting set up with a Git workflow does take some up-front investment, but it doesn't need to be difficult. Here are the steps you should follow before continuing.

1. Register a Github account if you don't have one. A straightforward rendering of your name is recommended.
2. Join Penn's [Github Campus Program](https://github.com/upenn), which will allow you access to some features like private repositories.
3. Make sure [git is installed](https://happygitwithr.com/install-git) in your system. If you have a Mac it's probably already installed.
4. Download [Github Desktop](https://desktop.github.com/). This is an GUI application to execute Git commands. You can also use the command line if you prefer (aka git-bash). Using the RStudio link to Git is clunky and lacks some basic tools like branch merging that are necessary, so you might as well use a GUI/command line anyway.

Once you're set up, try cloning this repository then trying out some basic git actions like pushing and pulling; [this](https://happygitwithr.com/) is a great resource specific to using Git/Github with R. 

### Box

We use Git/Github in conjunction with Box, because we often deal with data that are priviliged or contains personally identifiable information (PII). Github is NOT appropriate for any PII data, but Box (with appropriate privilege controls) is. **NO** non-public data should be committed to Git or stored anywhere other than Box. (Public data like Census data could in principle be stored on Github but it's better to keep all data source files in the same place (i.e., Box), and also to keep large files off Github.)

In terms of integrating Box with Git, the easiest is an old-fashioned method (there are APIs available but they come with certain limitations): simply referencing the file location with a filepath to the appropriate Box folder. This requires a small amount of setup because individual machines will have different paths to Box: this individually-variable path should be stored in R's Renviron startup file so that it can be recalled programmatically. 

To do this, do the following once per machine:

1. Make sure you have the Box Desktop application installed so there is a filepath to begin with.
2. Install the R usethis package if not already installed.
3. From an R console, run `usethis::edit_r_environ()`
4. In the editor that pops up, type a new line: `BOX_PATH = "PATH"`.
5. "PATH" should be replaced with your own machine's path to the top-level Box directory, for example: /Users/USERNAME/Library/CloudStorage/Box-Box
6. Note the lack of a final slash at the end of the path. Windows users should use the slash and not the native backslash.

When a Box path is desired, users should concatenate `Sys.getenv("BOX_PATH")` with the location of their file in the Box structure.

Note that only data should be stored on Box. Files and directories that will be under version control should live on your local machine and on Github, not anywhere on Box. A Readme should be provided on the Box project folder to point to the Github repo. No PII should be hardcoded into analysis code.

## Some tips

1. Github Desktop is fairly smart about suggesting actions. These suggestions should generally be followed.
2. Remember that your *local* repository is not the same as the *remote* repository (also called 'origin'). They are linked but independent entities. Changes made to the remote repository won't be visible on your local machine unless you take some action. You won't even know that there *are* changes to the remote repo unless you fetch it.
3. Always make sure your local repository is up to date with the remote repository before starting work. ('Fetch Origin' then 'Pull Origin' on Github Desktop.)
4. Corollary: Always pull in any changes to your local repository before pushing.
5. Remember to commit before doing anything else to change the state of your local or remote repository. Make the commit message clear and don't use the default message; like writing code comments, note the reason for the change, not the content of the change.
6. If **any** changes are made to the code by a pull, it's imperative to re-start RStudio and run the code again. If the new version of the code changed any analysis steps upstream (or changed any intermediate analysis products you're relying on), the R objects living in your environment will not have changed, and so you could go on working based on outdated assumptions about what *your* code is based on.
7. To minimize this, examine diffs between the newest commits and also keep your colleagues apprised of when their work might be affected by yours.
8. It is best practice to not commit changes directly to main. Instead, create a branch for whatever task you are working on, and when you're finished with that task, submit a pull request to merge in your branch to main. GitHub makes this easy (and in fact, the default option for merging branches). This is a little silly if you are the only one working on a repository, but it will make the development process more clear to others looking in the history. If there are any collaborators, it lets them know what is going on. The other collaborators should acklowledge the pull request and approve it expeditiously after any discussion is finished.
9. When you're working on a branch, take care to avoid your branch from diverging too much from main. At least once a day (e.g., before starting work), merge-commit main into *your* branch. Any merge conflicts that arise are best resolved earlier than later.
