### ### ### ### ### ###

# HP Filter Exercise - Base Estimation

# (Log of) Real GDP, Quarterly

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

source("1 - HP Filter Exercise - Quarterly Data in Logs.R")

##### HP Filter #####

# Set lambda (Ravn and Uhlig, 2002): 6.25 for annual data, 1600 for quarterly)
lambda_hp <- 1600

# Apply the filter, in logs:
gdp_log_filter <- hpfilter(log.gdp,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_filter2020q3 <- hpfilter(log.gdp2020q3,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_filter2020q2 <- hpfilter(log.gdp2020q2,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_filter2020q1 <- hpfilter(log.gdp2020q1,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_filter2019q4 <- hpfilter(log.gdp2019q4,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_filter2019q3 <- hpfilter(log.gdp2019q3,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_filter2019q2 <- hpfilter(log.gdp2019q2,type="lambda", freq=lambda_hp,drift=FALSE)

# Extract cycle and trend
gdp_log_trend2020q4 <- gdp_log_filter$trend
gdp_log_trend2020q3 <- gdp_log_filter2020q3$trend
gdp_log_trend2020q2 <- gdp_log_filter2020q2$trend
gdp_log_trend2020q1 <- gdp_log_filter2020q1$trend
gdp_log_trend2019q4 <- gdp_log_filter2019q4$trend
gdp_log_trend2019q3 <- gdp_log_filter2019q3$trend
gdp_log_trend2019q2 <- gdp_log_filter2019q2$trend

gdp_log_cycle2020q4 <- gdp_log_filter$cycle
gdp_log_cycle2020q3 <- gdp_log_filter2020q3$cycle
gdp_log_cycle2020q2 <- gdp_log_filter2020q2$cycle
gdp_log_cycle2020q1 <- gdp_log_filter2020q1$cycle
gdp_log_cycle2019q4 <- gdp_log_filter2019q4$cycle
gdp_log_cycle2019q3 <- gdp_log_filter2019q3$cycle
gdp_log_cycle2019q2 <- gdp_log_filter2019q2$cycle

# Final: convert to list or data frames:
library(tsbox)
# TS DF Format
data_log_trend <- ts_c(gdp_log_trend2020q4, gdp_log_trend2020q3, gdp_log_trend2020q2, gdp_log_trend2020q1, gdp_log_trend2019q4, gdp_log_trend2019q3, gdp_log_trend2019q2)
data_log_cycle <- ts_c(gdp_log_cycle2020q4, gdp_log_cycle2020q3, gdp_log_cycle2020q2, gdp_log_cycle2020q1, gdp_log_cycle2019q4, gdp_log_cycle2019q3, gdp_log_cycle2019q2)

#DF Format
Year_date <- seq(as.Date("1986/1/1"), as.Date("2020/10/1"), by= "quarters") # Date format 1
library(zoo) # Date format 1
Year_quarter <- as.yearqtr(Year_date, format = "%Y-%m-%d")


data_log_trendreal_df <- as.data.frame(data_log_trend)
data_log_trendreal_df$Year <- Year_quarter
data_log_trendreal_df$Year_date <- Year_date
data_log_cyclereal_df <- as.data.frame(data_log_cycle)
data_log_cyclereal_df$Year <- Year_quarter
data_log_cyclereal_df$Year_date <- Year_date

#### Export ####
#install.packages("writexl") #If needed
library(writexl)

write_xlsx(data_log_trendreal_df,"Outputs\\Log-Trend-real quarterly.xlsx")
write_xlsx(data_log_cyclereal_df,"Outputs\\Log-Cycle-real quarterly.xlsx")
