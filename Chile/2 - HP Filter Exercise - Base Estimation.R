### ### ### ### ### ###

# HP Filter Exercise - Base Estimation

# (Log of) Real GDP

# Franco Nuñez

### ### ### ### ### ###

# Clean 
#remove(list = ls(all.names = TRUE))
#gc()

# Load packages
#install.packages("mFilter")
#install.packages("quantmod")
library(mFilter)
library(readxl)

# Set directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

##### Load Data #####

source("1 - HP Filter Exercise - Data in Logs.R")

##### HP Filter #####

# Set lambda (Ravn and Uhlig, 2002): 6.25 for annual data, 1600 for quarterly)
lambda_hp <- 6.25

# Apply the filter, in logs:
gdp_log_filter <- hpfilter(log.gdp,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_filter2019 <- hpfilter(log.gdp2019,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_filter2018 <- hpfilter(log.gdp2018,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_filter2017 <- hpfilter(log.gdp2017,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_filter2016 <- hpfilter(log.gdp2016,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_filter2015 <- hpfilter(log.gdp2015,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_filter2014 <- hpfilter(log.gdp2014,type="lambda", freq=lambda_hp,drift=FALSE)

# Extract cycle and trend
gdp_log_trend2020 <- gdp_log_filter$trend
gdp_log_trend2019 <- gdp_log_filter2019$trend
gdp_log_trend2018 <- gdp_log_filter2018$trend
gdp_log_trend2017 <- gdp_log_filter2017$trend
gdp_log_trend2016 <- gdp_log_filter2016$trend
gdp_log_trend2015 <- gdp_log_filter2015$trend
gdp_log_trend2014 <- gdp_log_filter2014$trend

gdp_log_cycle2020 <- gdp_log_filter$cycle
gdp_log_cycle2019 <- gdp_log_filter2019$cycle
gdp_log_cycle2018 <- gdp_log_filter2018$cycle
gdp_log_cycle2017 <- gdp_log_filter2017$cycle
gdp_log_cycle2016 <- gdp_log_filter2016$cycle
gdp_log_cycle2015 <- gdp_log_filter2015$cycle
gdp_log_cycle2014 <- gdp_log_filter2014$cycle

# Final: convert to list or data frames:
library(tsbox)
# TS DF Format
data_log_trend <- ts_c(gdp_log_trend2020, gdp_log_trend2019, gdp_log_trend2018, gdp_log_trend2017, gdp_log_trend2016, gdp_log_trend2015, gdp_log_trend2014)
data_log_cycle <- ts_c(gdp_log_cycle2020, gdp_log_cycle2019, gdp_log_cycle2018, gdp_log_cycle2017, gdp_log_cycle2016, gdp_log_cycle2015, gdp_log_cycle2014)

#DF Format
Year <- 1960:2020
Year_date <- seq(as.Date("1960/1/1"), as.Date("2020/1/1"), "years")

data_log_trendreal_df <- as.data.frame(data_log_trend)
data_log_trendreal_df$Year <- Year
data_log_trendreal_df$Year_date <- Year_date
data_log_cyclereal_df <- as.data.frame(data_log_cycle)
data_log_cyclereal_df$Year <- Year
data_log_cyclereal_df$Year_date <- Year_date

#### Export ####
#install.packages("writexl")
library(writexl)

write_xlsx(data_log_trendreal_df,"Outputs\\Log-Trend-real.xlsx")
write_xlsx(data_log_cyclereal_df,"Outputs\\Log-Cycle-real.xlsx")