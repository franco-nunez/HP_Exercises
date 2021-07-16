### ### ### ### ### ###

# HP Filter Exercise

# Real GDP

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

# Set directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Load data:
# Serie: US Real Gross Domestic Product, Billions of Chained 2012 Dollars, Annual, Not Seasonally Adjusted
# Source: FRED St. Louis, available in https://fred.stlouisfed.org/series/GDPCA, April 2, 2021
gdp <- read_excel("Inputs\\RealGDPA.xls", skip = 10, sheet = 1)

#Check
#summary(gdp)
#str(gdp)
#plot(gdp)

# Convert to time series:
gdp <- ts(gdp$GDPCA, start = c(1929), frequency = 1)

# Generate auxiliar series, with different endings:
gdp2019 <- window(gdp, end=2019)
gdp2018 <- window(gdp, end=2018)
gdp2017 <- window(gdp, end=2017)
gdp2016 <- window(gdp, end=2016)
gdp2015 <- window(gdp, end=2015)
gdp2014 <- window(gdp, end=2014)

# Generate the gdp in logs
log.gdp <- log(gdp)*100
# Generate auxiliar series:
log.gdp2019 <- window(log.gdp, end=2019)
log.gdp2018 <- window(log.gdp, end=2018)
log.gdp2017 <- window(log.gdp, end=2017)
log.gdp2016 <- window(log.gdp, end=2016)
log.gdp2015 <- window(log.gdp, end=2015)
log.gdp2014 <- window(log.gdp, end=2014)

# Generate the change in gdp
growth.gdp <- diff(log.gdp)
growth.gdp2019 <- window(growth.gdp, end=2019)
growth.gdp2018 <- window(growth.gdp, end=2018)
growth.gdp2017 <- window(growth.gdp, end=2017)
growth.gdp2016 <- window(growth.gdp, end=2016)
growth.gdp2015 <- window(growth.gdp, end=2015)
growth.gdp2014 <- window(growth.gdp, end=2014)

# Remove series
#remove(gdp,gdp2019,gdp2018,gdp2017,gdp2016,gdp2015,gdp2014, log.gdp,log.gdp2019,log.gdp2018,log.gdp2017,log.gdp2016,log.gdp2015,log.gdp2014)