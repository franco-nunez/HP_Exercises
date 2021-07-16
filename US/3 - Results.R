### ### ### ### ### ###

# HP Filter Exercise - Results

# Real GDP

# Franco Nuñez

### ### ### ### ### ###

# Reference to scripts
Base_a <- "2 - HP Filter Exercise - Base Estimation.R"
Base_q <- "2 - HP Filter Exercise - Quarterly Base Estimation.R"
Forecast_a <- "2 - HP Filter Exercise - Estimation with forecasts in Log.R" 
Forecast_q <- "2 - HP Filter Exercise - Quarterly Estimation with forecasts in Log.R"

##### Option 1: only estimations and export ####

# Generate all data and export to Excel files:

# All = the 4 exercises
All <- c(Base_a,Base_q,Forecast_a,Forecast_q)

for (i in All){
  source(i)
}

# The outputs will be in the Outputs folder.