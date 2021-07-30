### ### ### ### ### ###

# HP Filter Exercise - Visualization

# Auxiliary data: OECD/FRED Recession data

# Franco Nuñez

### ### ### ### ### ###

# This code is based on:
# https://rpubs.com/FSl/609471
# (Author: Fabian Scheler, 30/04/2020)

library(fredr)
library(ecm)
library(writexl)
library(readxl)
#fredr_set_key("Your API Key")

st_date <-"1995-02-01"	# Data start here
ed_date <-"2020-12-31"
last_date <- "2020-12-31"

# Request data
recession<-fredr(series_id = "CHLRECDP",observation_start = as.Date(st_date), observation_end = as.Date(ed_date))

# Auxilary columns
recession$diff<-recession$value-lagpad(recession$value,k=1)
recession<-recession[!is.na(recession$diff),]

# Save
write_xlsx(recession,"Inputs\\OECDrecessions.xlsx")

# Check
recession <- read_excel("Inputs\\OECDrecessions.xlsx", sheet = 1)