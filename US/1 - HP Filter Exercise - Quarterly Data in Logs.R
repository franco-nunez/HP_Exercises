### ### ### ### ### ###

# HP Filter Exercise

# Real GDP, quarterly

# Franco Nuñez

### ### ### ### ### ###

# Clean (only if it runs separately)
#remove(list = ls(all.names = TRUE))
#gc()

# Load packages
#install.packages("mFilter")
#install.packages("quantmod")
library(mFilter)
library(readxl)


##### Load Data #####

# Set directory (if it runs separately)
#setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Load data:
# Serie: US Real Gross Domestic Product, Billions of Chained 2012 Dollars, Quarterly, Seasonally Adjusted Annual Rate
# Source: FRED St. Louis, available in https://fred.stlouisfed.org/series/GDPC1, April 2, 2021
gdp <- read_excel("Inputs\\RealGDPq.xls", skip = 10, sheet = 1)

#Check
#summary(gdp)
#str(gdp)
#plot(gdp)

# Convert to time series:
gdp <- ts(gdp$GDPC1, frequency = 4, start = c(1947,1))

# Generate the gdp in logs
log.gdp <- log(gdp)*100

# Generate auxiliary data
log.gdp2020q3 <- window(log.gdp, end=c(2020,3))
log.gdp2020q2 <- window(log.gdp, end=c(2020,2))
log.gdp2020q1 <- window(log.gdp, end=c(2020,1))
log.gdp2019q4 <- window(log.gdp, end=c(2019,4))
log.gdp2019q3 <- window(log.gdp, end=c(2019,3))
log.gdp2019q2 <- window(log.gdp, end=c(2019,2))

# Remove series
remove(gdp)


