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

#debt_gdp vs. year
df <- data.frame(armenia$year,czech_republic$debt_gdp,ukraine$debt_gdp,armenia$debt_gdp)
names(df) <- c("year","Czech Repulbic","Ukraine","Armenia")
df_melted<-melt(df,id.vars="year")
plot<-ggplot(data=df_melted,aes(x=year,y=value,shape=variable))+
  geom_line()+
  geom_point()+
  labs(shape="Countries",y="Debt to GDP ratio")
plot

#capital formation vs. year
df <- data.frame(armenia$year,czech_republic$capital/czech_republic$gdp,ukraine$capital/ukraine$gdp,armenia$capital/armenia$gdp)
names(df) <- c("year","Czech Repulbic","Ukraine","Armenia")
df_melted<-melt(df,id.vars="year")
plot<-ggplot(data=df_melted,aes(x=year,y=value,shape=variable))+
  geom_line()+
  geom_point()+
  labs(shape="Countries",y="Capital Formation as a percent of GDP")
plot
