### ### ### ### ### ###

# HP Filter Exercise - Visualization

# Auxiliary functions

# Franco Nuñez

### ### ### ### ### ###

# Define ####
# Load data
recession <- read_excel("Inputs\\NBERrecessions.xlsx")

# Last date for graph
last_date <- "2020-10-01"

# Set start date (for graph) automatically
month <- switch(quarter, 1, 4, 7, 10)
# Check
if(is.null(month)) {
  "ERROR: Quarter date not valid"
}
if(month!=10){
  month <- paste0("0",month)
} else month <- "10"
start_date <- paste0(year,"-", month,"-01")
remove(month)

# Call 
source("Auxiliary - NBER+FRED recessions.R")

# Function ####
library(ggplot2)
graph_cycle_nber = function(name, tit, subt, size_text=18, font_text="Times New Roman", size_lines=1.25, axis_breaks = "6 months", axis_labels= "%Y-%b"){
  graph_cycle <- ts_ggplot(plot_cycle)
  graph_cycle <- graph_cycle + add_rec_shade(as.Date("2017-01-01"),as.Date(last_date))
  graph_cycle <- graph_cycle +  geom_line(aes(x=time, y=value,color=factor(id)), size = size_lines)
  graph_cycle <- graph_cycle + theme_classic()
  graph_cycle <- graph_cycle +  theme(text=element_text(size=size_text,  family=font_text))
  graph_cycle <- graph_cycle +  theme(legend.position = "none")
  graph_cycle <- graph_cycle + scale_color_grey(start=0.9, end=0)
  graph_cycle <- graph_cycle + theme(axis.line = element_line(colour = "Black", 
                                                              size = 0.9, linetype = "solid"))
  graph_cycle <- graph_cycle + geom_hline(yintercept=0, linetype="dashed", 
                                          color = "Black", size=0.75)
  graph_cycle <- graph_cycle + theme(axis.text.x = element_text(color="Black"),
                                     axis.text.y = element_text(color="Black"))
  graph_cycle <- graph_cycle + ggtitle(tit, subtitle = subt)
  graph_cycle <- graph_cycle + xlab("")
  graph_cycle <- graph_cycle + scale_x_date(date_breaks = axis_breaks, date_labels = axis_labels)
  graph_cycle <- graph_cycle + ylab("")
}
