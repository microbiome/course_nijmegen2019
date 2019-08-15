# This script installs the required R libraries for the course.
#
# To install, run this in R: source("install_dependencies.R")
#
# Contact: <henrik.eckermann87@gmail.com>


# Tidyverse
install.packages("tidyverse")
install.packages("vegan")
install.packages("phyloseq")
install.packages("rmarkdown")
install.packages("knitr")
install.packages("BiocManager")
install.packages("devtools")

# Bioconductor packages
library(BiocManager)
BiocManager::install("DESeq2")

# Dedicated microbiome tools
library(devtools)
install_github("microbiome/microbiome")
install_github("microsud/microbiomeutilities")


# Optional tools that I used in the Hands-on examples
install.packages("GGally")
