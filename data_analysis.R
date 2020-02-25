library(readxl)
library(ggplot2)
library(reshape2)
library(ggforce)
czech_republic <- data.frame(read_excel("Data.xlsx",sheet=2))
ukraine <- data.frame(read_excel("Data.xlsx",sheet=3))
armenia <- data.frame(read_excel("Data.xlsx",sheet=4))

##################graphing function #########################

grapher <- function(title,df,y){
names(df) <- c("year","Czech Repulbic","Ukraine","Armenia")
df_melted<-melt(df,id.vars="year")
df_melted <- subset(df_melted,!is.na(df_melted$value))
plot<-ggplot(data=df_melted,aes(x=year,y=value,shape=variable))+
  geom_line()+
  geom_point()+
  labs(shape="Countries",y=y,title=title)+
  theme(plot.margin = margin(0.5,0.5,0.5,0.5,"cm"),plot.background = element_rect(colour="black"),
        axis.text.x = element_text(angle =45),plot.title = element_text(hjust=0.5))+
  scale_x_continuous(breaks=unique(df_melted$year))
plot
}

###########GDP##############
df <- data.frame(armenia$year,czech_republic$gdp,
                 ukraine$gdp,armenia$gdp)
title <- "GDP by Year"
y <- "GDP"
grapher(title,df,y)

###########GDP per capita##############
df <- data.frame(armenia$year,czech_republic$gdp_cap,
                 ukraine$gdp_cap,armenia$gdp_cap)
title <- "GDP per Capita by Year"
y <- "GDP per Capita"
grapher(title,df,y)

############telephones per 100 people#############
df <- data.frame(armenia$year,czech_republic$telephone,
                 ukraine$telephone,armenia$telephone)
title <- "Telephones per 100 people by Year"
y <- "Telephones per 100 people"
grapher(title,df,y)

#######GDP Growth###############
df <- data.frame(armenia$year,czech_republic$gdp_growth,
                 ukraine$gdp_growth,armenia$gdp_growth)
title <- "GDP Growth by Year"
y <- "GDP growth %"
grapher(title,df,y)

########labor force ###########
df <- data.frame(armenia$year,czech_republic$labor_growth,
                 ukraine$labor_growth,armenia$labor_growth)
title <- "Labor Force by year"
y<- "Labor Force"
grapher(title,df,y)

#######inflation############
df <- data.frame(armenia$year,czech_republic$inflation_cpi,
                 ukraine$inflation_cpi,armenia$inflation_cpi)
title <- "INflation by Year"
y<- "Inflation %"
grapher(title,df,y)

###########unemployment###########
df <- data.frame(armenia$year,czech_republic$unemployment,
                 ukraine$unemployment,armenia$unemployment)
title <- "Unemployment by Year"
y<- "Unemployment %"
grapher(title,df,y)

##########government debt as a percentage of GDP########
df <- data.frame(armenia$year,czech_republic$debt_gdp,
                 ukraine$debt_gdp,armenia$debt_gdp)
title <- "Government Debt as a Percentage of GDP"
y<- "Government Debt %"
grapher(title,df,y)

############FDI as a percentage of GDP############
df <- data.frame(armenia$year,czech_republic$fdi_gdp,
                 ukraine$fdi_gdp,armenia$fdi_gdp)
title <- "FDI as a Percentage of GDP"
y<- "FDI Debt %"
grapher(title,df,y)

###########Gross Capital formation as a percentage of GDP########
df <- data.frame(armenia$year,czech_republic$capital_gdp,
                 ukraine$capital_gdp,armenia$capital_gdp)
title <- "Gross Capital Formation as a Percentage of GDP"
y<- "Gross Capital Formation %"
grapher(title,df,y)

