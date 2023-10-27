# Learning Git

We want to be able to work on the same project seamlessly, without having to pass manually versioned files back and forth or being limited to only one person actively editing a file at the same time. Git is a version control system that lets collaborators work together on the same codebase seamlessly. In a research context, having snapshots of past analyses and having an authoritative source of code is also important for ensuring reproducibility. Github is the most popular platform for hosting Git repositories, and HIP's repositories are hosted here.

Getting set up with a Git workflow does take some up-front investment, but it doesn't need to be difficult. Here are the steps you should follow before continuing.

1. Register a Github account if you don't have one. A straightforward rendering of your name is recommended.
2. Join Penn's [Github Campus Program](https://github.com/upenn), which will allow you access to some features like private repositories.
3. Make sure [git is installed](https://happygitwithr.com/install-git) in your system. If you have a Mac it's probably already installed.
4. Download [Github Desktop](https://desktop.github.com/). This is an GUI application to execute Git commands. You can also use the command line if you prefer (aka git-bash). Using the RStudio link to Git is clunky and lacks some basic tools like branch merging that are necessary, so you might as well use a GUI/command line anyway.

Once you're set up, try cloning this repository then trying out some basic git actions like pushing and pulling; [this](https://happygitwithr.com/) is a great resource specific to using Git/Github with R. 

We use Git/Github in conjunction with Box, because we often deal with data that are priviliged or contains personally identifiable information (PII). Github is NOT appropriate for any PII data, but Box (with appropriate privilege controls) is. Be sure to look at the start_here.R script under the scripts folder and follow the directions to make sure your R environment knows about your personal Box path. **NO** non-public data should be committed to Git or stored anywhere other than Box. (Public data like Census data could in principle be stored on Github but it's better to keep all data source files in the same place (i.e., Box), and also to keep large files off Github.)
