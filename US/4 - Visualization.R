### ### ### ### ### ###

# HP Filter Exercise - Visualization

# Real GDP

# Franco Nuñez

### ### ### ### ### ###

# Set directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

##### Option 1: only estimations and export ####

# Call. This executes the 4 exercises, without graphs
source("3 - Results.R")

# The outputs will be in the Outputs folder.


##### Option 2: Estimations, export and visualization ####

# If necessary, install and import extra fonts:
#install.packages("extrafont")
#library(extrafont)
#font_import()
#y
#loadfonts(device = "win")

# Set titles (c is for cycles, t for trends), size of text
title_c =  ""
subtitle_c = ""
title_t =  ""
subtitle_t = ""

size_text = 26

# 2.a
# Generate the graphs with focus on recent years
source("3 - Visualization ST.R")

#2.b
# Generate the graphs with long term view
source("3 - Visualization LT.R")