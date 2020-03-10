#libraries needed, install if you do not have. 
library(readxl)
library(ggplot2)
library(reshape2)

#creates a dataframe for each country's data.
#replace country1,2,3 with your country names
#replace "Data.xlsx" with the name of your data sheet
#replace the number following "sheet=" as needed
country1 <- data.frame(read_excel("Data.xlsx",sheet=2))
country2 <- data.frame(read_excel("Data.xlsx",sheet=3))
country3 <- data.frame(read_excel("Data.xlsx",sheet=4))

##################graphing function #########################

#creates function named "grapher" with arguments:
#title: the title of the graph in string format
#df: a dataframe with columns for the year and each country's data for a specific statistic
#y: the title of the Y-axis (the X-axis is left as Year)

grapher <- function(title,df,y){
names(df) <- c("year","country1","country2","country3")
df_melted<-melt(df,id.vars="year")
df_melted <- subset(df_melted,!is.na(df_melted$value))
xrng <- range(df_melted$year)
yrng <- range(df_melted$value)
plot<-ggplot(data=df_melted,aes(x=year,y=value,shape=variable))+
  geom_line()+
  geom_point()+
  labs(shape="Countries",y=y,title=title,x="Year")+
  theme(plot.margin = margin(0.5,0.5,0.5,0.5,"cm"),plot.background = element_rect(colour="black"),
        axis.text.x = element_text(angle =45),plot.title = element_text(hjust=0.5))+
  scale_x_continuous(breaks=unique(df_melted$year))
plot
}

#unfortunately, you will need to add your source using 
#MS Paint after exporting a jpeg or Mac or Linux equivalent. 

#Examples:

###########GDP##############
df <- data.frame(armenia$year,czech_republic$gdp,
                 ukraine$gdp,armenia$gdp)
title <- "GDP by Year"
y <- "GDP"
grapher(title,df,y) #function call

#######inflation############
df <- data.frame(armenia$year,czech_republic$inflation_cpi,
                 ukraine$inflation_cpi,armenia$inflation_cpi)
title <- "Figure 2: Inflation by Year"
y<- "Inflation %"
grapher(title,df,y)



