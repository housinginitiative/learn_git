# Purpose -------------------------------------------------------------------------------------
# To help folks learn how to use git, github, and version control workflows to ensure
# project reproducibility and smooth collaborations.

# Preliminaries -------------------------------------------------------------------------------

# All of the packages below are highly recommended to be installed. 
# Package usethis is necessary for setup.
library(tidyverse)
library(tidylog)
library(here)
library(janitor)
library(scales)
library(readxl)
library(skimr)
library(usethis)

here::i_am("scripts/start_here.R")

# Set up Box path -----------------------------------------------------------------------------

# Only code and aggregated analysis products are to be synced to Github.
# Data must be stored on Box, because they can contain sensitive or privacy-protected information. 
# If you have not already installed the Box desktop application, please do that before continuing.

# To refer to files stored on Box, we need to have some way to refer to varying path names
# because the path that points to our Box installations is different on each machine.

# To store your own Box path, 
#   1) Uncomment and run the following line of code, which should open the Renviron file.
#                 usethis::edit_r_environ()
#   2) Add the following line to the Renviron file, save, then restart RStudio. 
#     PATH should be replaced with your own machine's path to the top-level Box directory,
#     for example: /Users/USERNAME/Library/CloudStorage/Box-Box
#                 BOX_PATH = "PATH"

# Examine your Renviron file again, and you should see your Box path. 
# This only needs to be done once per machine.

# Now, the following should show you the path of the test data file.
data_path = str_c(Sys.getenv("BOX_PATH"),
                  "/Learn git example data/LIHTCPUB.CSV")

# Now you should have some delicious LIHTC data. This is from the HUD LIHTC properties database,
# and being public data there's no requirement to keep this off github, but it's better practice
# to keep all data sources for the same project in the same place, and most projects will include 
# at least some non-public or privileged data.
data_test <- read_csv(data_path, guess_max = Inf)



