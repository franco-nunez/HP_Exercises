### ### ### ### ### ###

# HP Filter Exercise - Visualization

# Auxiliary data: NBER/FRED Recession data

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

st_date <-"1947-01-01"
ed_date <-"2020-12-31"
last_date <- "2020-12-31"

# Request data
recession<-fredr(series_id = "USRECD",observation_start = as.Date(st_date),observation_end = as.Date(ed_date))

# Auxilary columns
recession$diff<-recession$value-lagpad(recession$value,k=1)
recession<-recession[!is.na(recession$diff),]

# Save
write_xlsx(recession,"C:\\Users\\franc\\Documents\\HP Filter\\US\\Inputs\\NBERrecessions.xlsx")

# Check
recession <- read_excel("Inputs\\NBERrecessions.xlsx", sheet = 1)