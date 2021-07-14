### ### ### ### ### ###

# HP Filter Exercise - Visualization

# Auxiliary functions

# Franco Nuñez

### ### ### ### ### ###


graph_cycle = function(name, tit, subt, size_text=18, font_text="Times New Roman", size_lines=1.25, axis_breaks = "6 months", axis_labels= "%Y-%b"){
graph_cycle <- ts_ggplot(plot_cycle)
graph_cycle <- graph_cycle +  geom_line(aes(x=time, y=value,color=factor(id)), size = size_lines)
graph_cycle <- graph_cycle + theme_classic()
graph_cycle <- graph_cycle +  theme(text=element_text(size=size_text,  family=font_text))
graph_cycle <- graph_cycle +  theme(legend.position = "none")
graph_cycle <- graph_cycle + scale_color_grey(start=0.9, end=0)
graph_cycle <- graph_cycle + theme(axis.line = element_line(colour = "Black", 
                                                size = 0.8, linetype = "solid"))
graph_cycle <- graph_cycle + geom_hline(yintercept=0, linetype="dashed", 
                            color = "Black", size=0.75)
graph_cycle <- graph_cycle + theme(axis.text.x = element_text(color="Black"),
                       axis.text.y = element_text(color="Black"))
graph_cycle <- graph_cycle + ggtitle(tit, subtitle = subt)
graph_cycle <- graph_cycle + xlab("")
graph_cycle <- graph_cycle + scale_x_date(date_breaks = axis_breaks, date_labels = axis_labels)
graph_cycle <- graph_cycle + ylab("")
graph_cycle
}


graph_trend = function(name, tit, subt, size_text=18,font_text="Times New Roman", size_lines=1.25, axis_breaks = "6 months", axis_labels= "%Y-%b"){
  name <- ts_ggplot(plot_trend)
  name <- name +  geom_line(aes(x=time, y=value,color=factor(id)), size = size_lines)
  name <- name + theme_classic()
  name <- name +  theme(text=element_text(size=size_text,  family=font_text))
  name <- name +  theme(legend.position = "none")
  name <- name + scale_color_grey(start=0.9, end=0)
  name <- name + theme(axis.line = element_line(colour = "Black", 
                                                size = 0.8, linetype = "solid"))
  name <- name + theme(axis.text.x = element_text(color="Black"),
                       axis.text.y = element_text(color="Black"))
  name <- name + ggtitle(tit, subtitle = subt)
  name <- name + xlab("")
  name <- name + scale_x_date(date_breaks = axis_breaks, date_labels = axis_labels)
  name <- name + ylab("")
  name
}
