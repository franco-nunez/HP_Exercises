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
# Serie: Chile Real Gross Domestic Product, Billions of Chained  Chilean Pesos, Quarterly, Seasonally Adjusted
# Source: Banco Central de Chile (Central Bank of Chile), available in https://si3.bcentral.cl/Siete/ES/Siete/Cuadro/CAP_CCNN/MN_CCNN76/CCNN_HIST13_ENC_DESEST/CCNN_HIST13_ENC_DESEST?cbFechaInicio=1986&cbFechaTermino=2020&cbFrecuencia=QUARTERLY&cbCalculo=NONE&cbFechaBase=, May 16, 2021
gdp <- read_excel("Inputs\\RealGDPq.xlsx", skip = 1, sheet = 1)

#Check
#summary(gdp)
#str(gdp)
#plot(gdp)

# Convert to time series:
gdp <- ts(gdp$`1.Producto Interno Bruto`, frequency = 4, start = c(1986,1))

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


