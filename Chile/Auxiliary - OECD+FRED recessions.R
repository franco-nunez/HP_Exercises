### ### ### ### ### ###

# HP Filter Exercise - Visualization

# Auxiliary: OECD/FRED Recession data

# Franco Nuñez

### ### ### ### ### ###

# Function

add_rec_shade<-function(st_date,ed_date,shade_color=rec_color, shade_alpha = rec_alpha)
{
  # Load data
  recession <- subset(recession, date > as.POSIXct(start_date))
  recession <- subset(recession, date < as.POSIXct(last_date))
  
  # Set recession dates (and change format)
  recession.start<-recession[recession$diff==1,]$date
  recession.end<-recession[recession$diff==(-1),]$date
  
  
  # Set start and end dates if they are not assigned  
  if(length(recession.start)>length(recession.end))
  {recession.end<-c(recession.end,last_date)}
  if(length(recession.end)>length(recession.start))
  {recession.start<-c(min(recession$date),recession.start)}
  
  recession.start<-as.Date(recession.start)
  recession.end<-as.Date(recession.end)
  
  # Create final dataframe
  recs<-as.data.frame(cbind(recession.start,recession.end))
  recs$recession.start<-as.Date(as.numeric(recs$recession.start),origin=as.Date("1970-01-01"))
  recs$recession.end<-as.Date(recs$recession.end,origin=as.Date("1970-01-01"))
  
  # Final function
  if(nrow(recs)>0) {
    rec_shade<-geom_rect(data=recs, inherit.aes=F, 
                         aes(xmin=recession.start, xmax=recession.end, 
                             ymin=-Inf, ymax=+Inf), 
                         fill=shade_color, alpha=shade_alpha)
    return(rec_shade)
  }
}

