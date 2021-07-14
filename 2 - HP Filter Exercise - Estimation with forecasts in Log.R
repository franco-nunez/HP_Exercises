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

source("1 - HP Filter Exercise - Data and Forecasts in Log.R")

##### HP Filter #####

# Set lambda (Ravn and Uhlig, 2002): 6.25 for annual data, 1600 for quarterly)
lambda_hp <- 6.25

# Apply the filter, in log:
gdp_log_f_filter <- hpfilter(gdp.log_f,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_f_filter2019 <- hpfilter(gdp.log2019_f,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_f_filter2018 <- hpfilter(gdp.log2018_f,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_f_filter2017 <- hpfilter(gdp.log2017_f,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_f_filter2016 <- hpfilter(gdp.log2016_f,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_f_filter2015 <- hpfilter(gdp.log2015_f,type="lambda", freq=lambda_hp,drift=FALSE)
gdp_log_f_filter2014 <- hpfilter(gdp.log2014_f,type="lambda", freq=lambda_hp,drift=FALSE)

# Extract cycle and trend
gdp_log_f_trend <- gdp_log_f_filter$trend
gdp_log_f_trend2019 <- gdp_log_f_filter2019$trend
gdp_log_f_trend2018 <- gdp_log_f_filter2018$trend
gdp_log_f_trend2017 <- gdp_log_f_filter2017$trend
gdp_log_f_trend2016 <- gdp_log_f_filter2016$trend
gdp_log_f_trend2015 <- gdp_log_f_filter2015$trend
gdp_log_f_trend2014 <- gdp_log_f_filter2014$trend

gdp_log_f_cycle <- gdp_log_f_filter$cycle
gdp_log_f_cycle2019 <- gdp_log_f_filter2019$cycle
gdp_log_f_cycle2018 <- gdp_log_f_filter2018$cycle
gdp_log_f_cycle2017 <- gdp_log_f_filter2017$cycle
gdp_log_f_cycle2016 <- gdp_log_f_filter2016$cycle
gdp_log_f_cycle2015 <- gdp_log_f_filter2015$cycle
gdp_log_f_cycle2014 <- gdp_log_f_filter2014$cycle


### Remove last observations (the forecasts) ####
gdp_log_f_trend2020 <- window(gdp_log_f_trend, end = 2020)   
gdp_log_f_trend2019 <- window(gdp_log_f_trend2019, end = 2019)
gdp_log_f_trend2018 <- window(gdp_log_f_trend2018, end = 2018)
gdp_log_f_trend2017 <- window(gdp_log_f_trend2017, end = 2017)
gdp_log_f_trend2016 <- window(gdp_log_f_trend2016, end = 2016)
gdp_log_f_trend2015 <- window(gdp_log_f_trend2015, end = 2015)
gdp_log_f_trend2014 <- window(gdp_log_f_trend2014, end = 2014)

gdp_log_f_cycle2020 <- window(gdp_log_f_cycle, end = 2020)
gdp_log_f_cycle2019 <- window(gdp_log_f_cycle2019, end = 2019)
gdp_log_f_cycle2018 <- window(gdp_log_f_cycle2018, end = 2018)
gdp_log_f_cycle2017 <- window(gdp_log_f_cycle2017, end = 2017)
gdp_log_f_cycle2016 <- window(gdp_log_f_cycle2016, end = 2016)
gdp_log_f_cycle2015 <- window(gdp_log_f_cycle2015, end = 2015)
gdp_log_f_cycle2014 <- window(gdp_log_f_cycle2014, end = 2014)


# TS DF Format
#install.packages("tsbox") #If needed
library(tsbox)
data_log_trend <- ts_c(gdp_log_f_trend2020, gdp_log_f_trend2019, gdp_log_f_trend2018, gdp_log_f_trend2017, gdp_log_f_trend2016, gdp_log_f_trend2015, gdp_log_f_trend2014)

data_log_cycle <- ts_c(gdp_log_f_cycle2020, gdp_log_f_cycle2019, gdp_log_f_cycle2018, gdp_log_f_cycle2017, gdp_log_f_cycle2016, gdp_log_f_cycle2015, gdp_log_f_cycle2014)


#DF Format
Year <- 1960:2020
Year_date <- seq(as.Date("1960/1/1"), as.Date("2020/1/1"), "years")

data_log_trendreal_df <- as.data.frame(data_log_trend)
data_log_trendreal_df$Year <- Year
data_log_trendreal_df$Year_date <- Year_date
data_log_cyclereal_df <- as.data.frame(data_log_cycle)
data_log_cyclereal_df$Year <- Year
data_log_cyclereal_df$Year_date <- Year_date

## Export:
#install.packages("writexl") #If needed
library(writexl)
write_xlsx(data_log_trendreal_df,"Outputs\\Log-Trend-real-withforecasts-onlyobs.xlsx")
write_xlsx(data_log_cyclereal_df,"Outputs\\Log-Cycle-real-withforecasts-onlyobs.xlsx")