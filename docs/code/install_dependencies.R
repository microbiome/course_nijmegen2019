# This script installs the required R libraries for the course.
#
# To install, run this in R: source("install_dependencies.R")
#
# Contact: <henrik.eckermann87@gmail.com>


# Tidyverse
install.packages("tidyverse")

# Dedicated microbiome tools
library(devtools)
install_github("microbiome/microbiome")
install_github("microsud/microbiomeutilities")