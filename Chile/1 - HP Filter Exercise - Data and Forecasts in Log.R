### ### ### ### ### ###

# HP Filter  Second Exercise

# (Log of) Real GDP, WEO forecasts

# Franco Nuñez

### ### ### ### ### ###

##### Load Data ####

# Set directory (if it runs separately)
#setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Serie: WEO forecast of Chile Real Gross Domestic Product, % Change, Annual, Not Seasonally Adjusted.
# Source: IMF, World Economic Outlook Database, available in https://www.imf.org/external/pubs/ft/weo/data/WEOhistorical.xlsx
# Details: 2014, 2015, 2016, 2017, 2018, 2019 and 2020 Fall editions
library(readxl)
forecasts <- read_excel("Inputs\\WEOforecasts_Chile.xlsx", sheet = 1)
forecasts <- forecasts/100

# Serie: Chile Real Gross Domestic Product, Billions of Chained  Chilean Pesos, Annual, Seasonally Adjusted
# Source:  Banco Central de Chile (Central Bank of Chile), available in https://si3.bcentral.cl/Siete/ES/Siete/Cuadro/CAP_CCNN/MN_CCNN76/CCNN_HIST13_ENC/CCNN_HIST13_ENC?cbFechaInicio=1960&cbFechaTermino=2020&cbFrecuencia=ANNUAL&cbCalculo=NONE&cbFechaBase=, May 16, 2021
#source("1 - HP Filter Exercise - Data in Growth.R")
source("1 - HP Filter Exercise - Data in Logs.R")


# Export the data in logs, in order to combine it with the forecast in growth
library(tsbox)
for_export <- ts_c(log.gdp2014, log.gdp2015, log.gdp2016, log.gdp2017, log.gdp2018, log.gdp2019, log.gdp)

library(writexl)
write_xlsx(as.data.frame(for_export),"Outputs\\[Generated]Log data.xlsx")

# After processing, we get the data combined with forecasts:
forecast_log <- read_excel("Inputs\\Combined_Chile.xlsx", sheet = 1)


# Convert to time-series:
gdp.log2014_f <- ts(forecast_log$log.gdp2014, start = c(1960), end= c(2019),frequency = 1)
gdp.log2015_f <- ts(forecast_log$log.gdp2015, start = c(1960), end= c(2020),frequency = 1)
gdp.log2016_f <- ts(forecast_log$log.gdp2016, start = c(1960), end= c(2021),frequency = 1)
gdp.log2017_f <- ts(forecast_log$log.gdp2017, start = c(1960), end= c(2022),frequency = 1)
gdp.log2018_f <- ts(forecast_log$log.gdp2018, start = c(1960), end= c(2023),frequency = 1)
gdp.log2019_f <- ts(forecast_log$log.gdp2019, start = c(1960), end= c(2024),frequency = 1)
gdp.log_f <- ts(forecast_log$log.gdp, start = c(1960), end= c(2025),frequency = 1)
# Multiply by 100
gdp.log2014_f <- gdp.log2014_f*100
gdp.log2015_f <- gdp.log2015_f*100
gdp.log2016_f <- gdp.log2016_f*100
gdp.log2017_f <- gdp.log2017_f*100
gdp.log2018_f <- gdp.log2018_f*100
gdp.log2019_f <- gdp.log2019_f*100
gdp.log_f <- gdp.log_f*100


# Remove data
remove(for_export, forecast_log)

