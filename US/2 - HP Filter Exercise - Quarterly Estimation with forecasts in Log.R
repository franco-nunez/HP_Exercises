### ### ### ### ### ###

# HP Filter  Second Exercise

# (Log of) Real GDP, WEO forecasts

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

source("1 - HP Filter Exercise - Data and Forecasts in Quarterly Log.R")
##### HP Filter #####

# Set lambda (Ravn and Uhlig, 2002): 6.25 for annual data, 1600 for quarterly)
lambda_hp <- 1600

# Apply the filter, in log:
gdp_log_f_filter <- hpfilter(gdp.log_f,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_f_filter2020q3 <- hpfilter(gdp.log2020q3_f,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_f_filter2020q2 <- hpfilter(gdp.log2020q2_f,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_f_filter2020q1 <- hpfilter(gdp.log2020q1_f,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_f_filter2019q4 <- hpfilter(gdp.log2019q4_f,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_f_filter2019q3 <- hpfilter(gdp.log2019q3_f,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_f_filter2019q2 <- hpfilter(gdp.log2019q2_f,type="lambda", freq=lambda_hp,drift=FALSE)

# Extract cycle and trend
gdp_log_f_trend <- gdp_log_f_filter$trend
gdp_log_f_trend2020q3 <- gdp_log_f_filter2020q3$trend
gdp_log_f_trend2020q2 <- gdp_log_f_filter2020q2$trend
gdp_log_f_trend2020q1 <- gdp_log_f_filter2020q1$trend
gdp_log_f_trend2019q4 <- gdp_log_f_filter2019q4$trend
gdp_log_f_trend2019q3 <- gdp_log_f_filter2019q3$trend
gdp_log_f_trend2019q2 <- gdp_log_f_filter2019q2$trend

gdp_log_f_cycle <- gdp_log_f_filter$cycle
gdp_log_f_cycle2020q3 <- gdp_log_f_filter2020q3$cycle
gdp_log_f_cycle2020q2 <- gdp_log_f_filter2020q2$cycle
gdp_log_f_cycle2020q1 <- gdp_log_f_filter2020q1$cycle
gdp_log_f_cycle2019q4 <- gdp_log_f_filter2019q4$cycle
gdp_log_f_cycle2019q3 <- gdp_log_f_filter2019q3$cycle
gdp_log_f_cycle2019q2 <- gdp_log_f_filter2019q2$cycle


### Remove last observations (the forecasts) ####
gdp_log_f_trend2020q4 <- window(gdp_log_f_trend, end = c(2020,4)) 
gdp_log_f_trend2020q3 <- window(gdp_log_f_trend2020q3, end = c(2020,3))
gdp_log_f_trend2020q2 <- window(gdp_log_f_trend2020q2, end = c(2020,2))
gdp_log_f_trend2020q1 <- window(gdp_log_f_trend2020q1, end = c(2020,1))
gdp_log_f_trend2019q4 <- window(gdp_log_f_trend2019q4, end = c(2019,4))
gdp_log_f_trend2019q3 <- window(gdp_log_f_trend2019q3, end = c(2019,3))
gdp_log_f_trend2019q2 <- window(gdp_log_f_trend2019q2, end = c(2019,2))

gdp_log_f_cycle2020q4 <- window(gdp_log_f_cycle, end = c(2020,4))
gdp_log_f_cycle2020q3 <- window(gdp_log_f_cycle2020q3, end =  c(2020,3))
gdp_log_f_cycle2020q2 <- window(gdp_log_f_cycle2020q2, end =  c(2020,2))
gdp_log_f_cycle2020q1 <- window(gdp_log_f_cycle2020q1, end =  c(2020,1))
gdp_log_f_cycle2019q4 <- window(gdp_log_f_cycle2019q4, end =  c(2019,4))
gdp_log_f_cycle2019q3 <- window(gdp_log_f_cycle2019q3, end = c(2019,3))
gdp_log_f_cycle2019q2 <- window(gdp_log_f_cycle2019q2, end = c(2019,2))


# TS DF Format
#install.packages("tsbox") #If needed
library(tsbox)
data_log_trend <- ts_c(gdp_log_f_trend2020q4, gdp_log_f_trend2020q3, gdp_log_f_trend2020q2, gdp_log_f_trend2020q1, gdp_log_f_trend2019q4, gdp_log_f_trend2019q3, gdp_log_f_trend2019q2)

data_log_cycle <- ts_c(gdp_log_f_cycle2020q4, gdp_log_f_cycle2020q3, gdp_log_f_cycle2020q2, gdp_log_f_cycle2020q1, gdp_log_f_cycle2019q4, gdp_log_f_cycle2019q3, gdp_log_f_cycle2019q2)


#DF Format
Year_date <- seq(as.Date("1947/1/1"), as.Date("2020/10/1"), by= "quarters") # Date format 1
library(zoo) # Date format 1
Year_quarter <- as.yearqtr(Year_date, format = "%Y-%m-%d")

data_log_trendreal_df <- as.data.frame(data_log_trend)
data_log_trendreal_df$Year <- Year_quarter
data_log_trendreal_df$Year_date <- Year_date
data_log_cyclereal_df <- as.data.frame(data_log_cycle)
data_log_cyclereal_df$Year <- Year_quarter
data_log_cyclereal_df$Year_date <- Year_date

## Export:
#install.packages("writexl") #If needed
library(writexl)
write_xlsx(data_log_trendreal_df,"Outputs\\Log-Trend-real-withforecasts-onlyobs quarterly.xlsx")
write_xlsx(data_log_cyclereal_df,"Outputs\\Log-Cycle-real-withforecasts-onlyobs quarterly.xlsx.xlsx")