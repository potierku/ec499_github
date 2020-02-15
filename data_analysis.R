library(readxl)
library(ggplot2)
library(reshape2)
czech_republic <- data.frame(read_excel("Data.xlsx",sheet=2))
ukraine <- data.frame(read_excel("Data.xlsx",sheet=3))
armenia <- data.frame(read_excel("Data.xlsx",sheet=4))


#gdp vs. year
df <- data.frame(armenia$year,czech_republic$gdp,ukraine$gdp,armenia$gdp)
names(df) <- c("year","Czech Repulbic","Ukraine","Armenia")
df_melted<-melt(df,id.vars="year")
plot<-ggplot(data=df_melted,aes(x=year,y=value,shape=variable))+
  geom_line()+
  geom_point()+
  labs(shape="Countries",y="GDP")
plot

#gdp per capita vs. year
df <- data.frame(armenia$year,czech_republic$gdp_cap,ukraine$gdp_cap,armenia$gdp_cap)
names(df) <- c("year","Czech Repulbic","Ukraine","Armenia")
df_melted<-melt(df,id.vars="year")
plot<-ggplot(data=df_melted,aes(x=year,y=value,shape=variable))+
  geom_line()+
  geom_point()+
  labs(shape="Countries",y="GDP per Capita")
plot

#telephones per 100 people vs. year
df <- data.frame(armenia$year,czech_republic$telephone,ukraine$telephone,armenia$telephone)
names(df) <- c("year","Czech Repulbic","Ukraine","Armenia")
df_melted<-melt(df,id.vars="year")
plot<-ggplot(data=df_melted,aes(x=year,y=value,shape=variable))+
  geom_line()+
  geom_point()+
  labs(shape="Countries",y="Telephones per 100 people")
plot

#gdp_growth vs. year
df <- data.frame(armenia$year,czech_republic$gdp_growth,ukraine$gdp_growth,armenia$gdp_growth)
names(df) <- c("year","Czech Repulbic","Ukraine","Armenia")
df_melted<-melt(df,id.vars="year")
plot<-ggplot(data=df_melted,aes(x=year,y=value,shape=variable))+
  geom_line()+
  geom_point()+
  labs(shape="Countries",y="GDP growth (%)")
plot

#labor force vs. year
df <- data.frame(armenia$year,czech_republic$labor_growth,ukraine$labor_growth,armenia$labor_growth)
names(df) <- c("year","Czech Repulbic","Ukraine","Armenia")
df_melted<-melt(df,id.vars="year")
plot<-ggplot(data=df_melted,aes(x=year,y=value,shape=variable))+
  geom_line()+
  geom_point()+
  labs(shape="Countries",y="Labor Growth")
plot

basic_czech <-lm(czech_republic$gdp_growth ~ czech_republic$labor_growth + 
             (czech_republic$capital_gdp))
summary(basic_czech)

#inflation vs year 
df <- data.frame(armenia$year,czech_republic$inflation_cpi,ukraine$inflation_cpi,armenia$inflation_cpi)
names(df) <- c("year","Czech Repulbic","Ukraine","Armenia")
df_melted<-melt(df,id.vars="year")
plot<-ggplot(data=df_melted,aes(x=year,y=value,shape=variable))+
  geom_line()+
  geom_point()+
  labs(shape="Countries",y="Inflation Rate (%)")
plot

#unemployment vs year 
df <- data.frame(armenia$year,czech_republic$unemployment,ukraine$unemployment,armenia$unemployment)
names(df) <- c("year","Czech Repulbic","Ukraine","Armenia")
df_melted<-melt(df,id.vars="year")
df_melted <- subset(df_melted,!is.na(df_melted$value))
which(is.na(df_melted))
plot<-ggplot(data=df_melted,aes(x=year,y=value,shape=variable))+
  geom_line()+
  geom_point()+
  labs(shape="Countries",y="Unemployment (%)")+
  scale_x_continuous(breaks=unique(df_melted$year))
plot

#government debt as a percentage of GDP
df <- data.frame(armenia$year,czech_republic$debt_gdp,ukraine$debt_gdp,armenia$debt_gdp)
names(df) <- c("year","Czech Repulbic","Ukraine","Armenia")
df_melted<-melt(df,id.vars="year")
df_melted <- subset(df_melted,!is.na(df_melted$value))
which(is.na(df_melted))
plot<-ggplot(data=df_melted,aes(x=year,y=value,shape=variable))+
  geom_line()+
  geom_point()+
  labs(shape="Countries",y="Debt as a Percentage of GDP")+
  scale_x_continuous(breaks=unique(df_melted$year))
plot

#FDI as a percentage of GDP
df <- data.frame(armenia$year,czech_republic$fdi_gdp,ukraine$fdi_gdp,armenia$fdi_gdp)
names(df) <- c("year","Czech Repulbic","Ukraine","Armenia")
df_melted<-melt(df,id.vars="year")
df_melted <- subset(df_melted,!is.na(df_melted$value))
which(is.na(df_melted))
plot<-ggplot(data=df_melted,aes(x=year,y=value,shape=variable))+
  geom_line()+
  geom_point()+
  labs(shape="Countries",y="FDI as a Percentage of GDP")+
  scale_x_continuous(breaks=unique(df_melted$year))
plot

#Gross Capital formation as a percentage of GDP
df <- data.frame(armenia$year,czech_republic$capital_gdp,ukraine$capital_gdp,armenia$capital_gdp)
names(df) <- c("year","Czech Repulbic","Ukraine","Armenia")
df_melted<-melt(df,id.vars="year")
df_melted <- subset(df_melted,!is.na(df_melted$value))
which(is.na(df_melted))
plot<-ggplot(data=df_melted,aes(x=year,y=value,shape=variable))+
  geom_line()+
  geom_point()+
  labs(shape="Countries",y="Gross Capital Formation as a Percentage of GDP")+
  scale_x_continuous(breaks=unique(df_melted$year))
plot
