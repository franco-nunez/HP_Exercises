### ### ### ### ### ###

# HP Filter  Second Exercise

# (Log of) Real GDP, WEO forecasts

# Franco Nuñez

### ### ### ### ### ###

##### Load Data ####

# Set directory (if it runs separately)
#setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Serie: WEO forecast of US Real Gross Domestic Product, % Change, Annual, Not Seasonally Adjusted.
# Source: IMF, World Economic Outlook Database, available in https://www.imf.org/external/pubs/ft/weo/data/WEOhistorical.xlsx
# Details: 2014, 2015, 2016, 2017, 2018, 2019 and 2020 Fall editions
library(readxl)
forecasts <- read_excel("Inputs\\WEOforecasts.xlsx", sheet = 1)
forecasts <- forecasts/100

# Serie: US Real Gross Domestic Product, Billions of Chained 2012 Dollars, Annual, Not Seasonally Adjusted
# Source: FRED St. Louis, available in https://fred.stlouisfed.org/series/GDPCA, April 2, 2021
source("1 - HP Filter Exercise - Quarterly Data in Logs.R")


# Export the data in logs, in order to combine it with the forecast in growth
library(tsbox)
for_export <- ts_c(log.gdp2019q2, log.gdp2019q3, log.gdp2019q4, log.gdp2020q1, log.gdp2020q2, log.gdp2020q3, log.gdp)

library(writexl)
write_xlsx(as.data.frame(for_export),"Outputs\\[Generated]Log Q data.xlsx")

# After processing, we get the data combined with forecasts.
# Because the WEO forecast are annual, we need to assume a "quarterly path". The match with the average growth of the next year was prioritized. Example: if we are considering the Fall 2019 edition of WEO, the growth path is wanted to generate a % variation equal (or similar) for 2020 (vs 2019, in average).
forecast_log <- read_excel("Inputs\\Combinedq.xlsx", sheet = 1)


# Convert to time-series:
gdp.log2019q2_f <- ts(forecast_log$log.gdp2019q2, start = c(1947,1), end= c(2020,3),frequency = 4)
gdp.log2019q3_f <- ts(forecast_log$log.gdp2019q3, start = c(1947,1), end= c(2020,4),frequency = 4)
gdp.log2019q4_f <- ts(forecast_log$log.gdp2019q4, start = c(1947,1), end= c(2021,1),frequency = 4)
gdp.log2020q1_f <- ts(forecast_log$log.gdp2020q1, start = c(1947,1), end= c(2021,2),frequency = 4)
gdp.log2020q2_f <- ts(forecast_log$log.gdp2020q2, start = c(1947,1), end= c(2021,3),frequency = 4)
gdp.log2020q3_f <- ts(forecast_log$log.gdp2020q3, start = c(1947,1), end= c(2021,4),frequency = 4)
gdp.log_f <- ts(forecast_log$log.gdp, start = c(1947,1), end= c(2022,1),frequency = 4)

# Multiply por 100
gdp.log2019q2_f <- gdp.log2019q2_f *100
gdp.log2019q3_f <- gdp.log2019q3_f*100
gdp.log2019q4_f <- gdp.log2019q4_f*100
gdp.log2020q1_f <- gdp.log2020q1_f*100
gdp.log2020q2_f <- gdp.log2020q2_f*100
gdp.log2020q3_f <- gdp.log2020q3_f*100
gdp.log_f <- gdp.log_f*100

# Remove data
remove(for_export, forecast_log)

