### ### ### ### ### ###

# HP Filter Exercise - Visualization

# Real GDP

# Franco Nuñez

### ### ### ### ### ###

# Set directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# These two lines check and install packages if needed
if (!require("pacman")) install.packages("pacman")
pacman::p_load(extrafont, ggplot2, zoo, writexl, tsbox, readxl, mFilter)

##### Option 1: only estimations and export ####

# Call. This executes the 4 exercises, without graphs
source("3 - Results.R")

# The outputs will be in the Outputs folder.


##### Option 2: Estimations, export and visualization ####

# Import extra fonts:
library(extrafont)
font_import()
loadfonts(device = "win")

# Set titles (c is for cycles, t for trends), size of text and image details
title_c =  ""
subtitle_c = ""
title_t =  ""
subtitle_t = ""

size_text = 36

image_format = ".png" # ".png" or ".jpeg", other formats need inclusion in postscript() device
rec_color = "goldenrod3" # Recessions shade color
rec_alpha = 0.15 # Recessions alpha (transparency)

# 2.a
# Generate the graphs with focus on recent years
source("3 - Visualization ST.R")

#2.b
# Generate the graphs with long term view
source("3 - Visualization LT.R")