### ### ### ### ### ###

# HP Filter Exercise - Visualization

# Real GDP

# Franco Nuñez

### ### ### ### ### ###

# Set directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Reference to scripts
Base_a <- "2 - HP Filter Exercise - Base Estimation.R"
Base_q <- "2 - HP Filter Exercise - Quarterly Base Estimation.R"
Forecast_a <- "2 - HP Filter Exercise - Estimation with forecasts in Log.R" 
Forecast_q <- "2 - HP Filter Exercise - Quarterly Estimation with forecasts in Log.R"


##### Option 2: Estimations, export and visualization ####

#### 2.a: This file generate the graphs with recent years focus.

# If necessary, install and import extra fonts:
#install.packages("extrafont")
#library(extrafont)
#font_import()
#y
#loadfonts(device = "win")

# What exercise do you want to estimate and plot?

# Base_a = Base estimation, annual data
# Base_q = Base estimation, quarterly data
# Forecast_a = Forecast included, annual data
# Forecast_q = Forecast included, quarterly data

# 2.1. Base, annual#####
# Change the argument, according to the desired exercise:
exercise <- Base_a

source(exercise)


# Subset
# Select start dates for the graphs
year=2013 # Suggested: 2013 for Annual, 2017 or 2018 for Quarterly
quarter=1 #1 for annual data

plot_cycle <- window(data_log_cycle, start=c(year,quarter))
plot_trend <- window(data_log_trend, start=c(year,quarter))

### Option a (quick): use ts_plot
ts_plot(plot_cycle)
ts_plot(plot_trend)

### Option b: use ggplot
library(ggplot2)
library(extrafont)
loadfonts(device = "win")

# Load functions
source("Auxiliary - graphs.R")

#Choose titles
#title_c =  ""
#subtitle_c = ""

# Choose text size
# size_text=24

#Plot cycles
graph_cycle(tit=title_c, subt=subtitle_c, size_text=size_text, axis_breaks = "1 year", axis_labels= "%Y")
ggsave(paste0("Cycles-annual-base starting in ", year, "-", quarter,".png"), path ="Outputs", width = 12, height=7) # Save as .png image

#Choose titles
#title_t =  ""
#subtitle_t = ""

#Plot tendencies
graph_trend(tit=title_t, subt=subtitle_t, size_text=size_text, axis_breaks = "1 year", axis_labels= "%Y")
ggsave(paste0("Trends-annual-base starting in ", year, "-", quarter,".png"), path ="Outputs", width = 12, height=7) # Save as .png image

# 2.2. Base, quarterly#####
# Change the argument, according to the desired exercise:
exercise <- Base_q

source(exercise)


# Subset
# Select start dates for the graphs
year=2017 # Suggested: 2013 for Annual, 2017 or 2018 for Quarterly
quarter=1 #1 for annual data

plot_cycle <- window(data_log_cycle, start=c(year,quarter))
plot_trend <- window(data_log_trend, start=c(year,quarter))

### Option a (quick): use ts_plot
ts_plot(plot_cycle)
ts_plot(plot_trend)

### Option b: use ggplot 
#library(ggplot2) #(without # if it runs without execute 2.1)
#library(extrafont)
#loadfonts(device = "win")

# Load functions
source("Auxiliary - graphs.R")

#Choose titles
#title_c =  ""
#subtitle_c = " "

#Plot cycles
graph_cycle(tit=title_c, subt=subtitle_c , size_text=size_text, axis_breaks = "6 months", axis_labels= "%Y-%b")
ggsave(paste0("Cycles-quarterly-base starting in ", year, "-", quarter,".png"), path ="Outputs", width = 12, height=7) # Save as .png image

#Choose titles
#title_t =  ""
#subtitle_t = ""

#Plot tendencies
graph_trend(tit=title_t, subt=subtitle_t, size_text=size_text, axis_breaks = "6 months", axis_labels= "%Y-%b")
ggsave(paste0("Trends-quarterly-base starting in ", year, "-", quarter,".png"), path ="Outputs", width = 12, height=7) # Save as .png image

# 2.3. With forecasts, annual#####
# Change the argument, according to the desired exercise:
exercise <- Forecast_a

source(exercise)


# Subset
# Select start dates for the graphs
year=2013 # Suggested: 2013 for Annual, 2017 or 2018 for Quarterly
quarter=1 #1 for annual data

plot_cycle <- window(data_log_cycle, start=c(year,quarter))
plot_trend <- window(data_log_trend, start=c(year,quarter))

### Option a (quick): use ts_plot
ts_plot(plot_cycle)
ts_plot(plot_trend)

### Option b: use ggplot
#library(ggplot2)
#library(extrafont)
#loadfonts(device = "win")

# Load functions
source("Auxiliary - graphs.R")

#Choose titles
#title_c =  ""
#subtitle_c = ""

#Plot cycles
graph_cycle(tit=title_c, subt=subtitle_c, size_text=size_text, axis_breaks = "1 year", axis_labels= "%Y")
ggsave(paste0("Cycles-annual-forecasts starting in ", year, "-", quarter,".png"), path ="Outputs", width = 12, height=7) # Save as .png image

#Choose titles
#title_t =  ""
#subtitle_t = ""

#Plot tendencies
graph_trend(tit=title_t, subt=subtitle_t, size_text=size_text, axis_breaks = "1 year", axis_labels= "%Y")
ggsave(paste0("Trends-annual-forecasts starting in ", year, "-", quarter,".png"), path ="Outputs", width = 12, height=7) # Save as .png image

# 2.4. With forecasts, quarterly#####
# Change the argument, according to the desired exercise:
exercise <- Forecast_q

source(exercise)


# Subset
# Select start dates for the graphs
year=2017 # Suggested: 2013 for Annual, 2017 or 2018 for Quarterly
quarter=1 #1 for annual data

plot_cycle <- window(data_log_cycle, start=c(year,quarter))
plot_trend <- window(data_log_trend, start=c(year,quarter))

### Option a (quick): use ts_plot
ts_plot(plot_cycle)
ts_plot(plot_trend)

### Option b: use ggplot
#library(ggplot2)
#library(extrafont)
#loadfonts(device = "win")

# Load functions
source("Auxiliary - graphs.R")

#Choose titles
#title_c =  ""
#subtitle_c = ""

#Plot cycles
graph_cycle(tit=title_c, subt=subtitle_c, size_text=size_text, axis_breaks = "6 months", axis_labels= "%Y-%b")
ggsave(paste0("Cycles-quarterly-forecasts starting in ", year, "-", quarter,".png"), path ="Outputs", width = 12, height=7) # Save as .png image

#Choose titles
#title_t =  ""
#subtitle_t = ""

#Plot tendencies
graph_trend(tit=title_t, subt=subtitle_t, size_text=size_text, axis_breaks = "6 months", axis_labels= "%Y-%b")
ggsave(paste0("Trends-quarterly-forecasts starting in ", year, "-", quarter,".png"), path ="Outputs", width = 12, height=7) # Save as .png image







