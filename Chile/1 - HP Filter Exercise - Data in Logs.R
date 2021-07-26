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

# Set directory (if it runs separately)
#setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Load data:
# Serie: Chile Real Gross Domestic Product, Billions of Chained  Chilean Pesos, Annual, Seasonally Adjusted
# Source:  Banco Central de Chile (Central Bank of Chile), available in https://si3.bcentral.cl/Siete/ES/Siete/Cuadro/CAP_CCNN/MN_CCNN76/CCNN_HIST13_ENC/CCNN_HIST13_ENC?cbFechaInicio=1960&cbFechaTermino=2020&cbFrecuencia=ANNUAL&cbCalculo=NONE&cbFechaBase=, May 16, 2021
gdp <- read_excel("Inputs\\RealGDPA.xlsx", skip = 1, sheet = 1)

#Check
#summary(gdp)
#str(gdp)
#plot(gdp)

# Convert to time series:
gdp <- ts(gdp$`1.Producto Interno Bruto`, start = c(1960), frequency = 1)

# Generate auxiliar series, with different endings:
gdp2019 <- window(gdp, end=2019)
gdp2018 <- window(gdp, end=2018)
gdp2017 <- window(gdp, end=2017)
gdp2016 <- window(gdp, end=2016)
gdp2015 <- window(gdp, end=2015)
gdp2014 <- window(gdp, end=2014)

# Generate the gdp in logs
log.gdp <- log(gdp)*100
# Generate auxiliary series:
log.gdp2019 <- window(log.gdp, end=2019)
log.gdp2018 <- window(log.gdp, end=2018)
log.gdp2017 <- window(log.gdp, end=2017)
log.gdp2016 <- window(log.gdp, end=2016)
log.gdp2015 <- window(log.gdp, end=2015)
log.gdp2014 <- window(log.gdp, end=2014)

# Remove series
remove(gdp,gdp2019,gdp2018,gdp2017,gdp2016,gdp2015,gdp2014)