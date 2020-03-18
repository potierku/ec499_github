library(readxl)
library(forecast)
library(DataCombine)
czech_republic <- data.frame(read_excel("Data.xlsx",sheet=2))
ukraine <- data.frame(read_excel("Data.xlsx",sheet=3))
armenia <- data.frame(read_excel("Data.xlsx",sheet=4))

# create time trend column from start year of transition
czech_republic$trend <-c(-1:31) #start year 1989
ukraine$trend <- c(-3:29) #start year 1991
armenia$trend <- c(-3:29) #start year of 1991


#static model (no lags)
static_linear_model <- function(df){
  static_lm<-lm(gdp_growth ~ gdp_cap+unemployment+inflation_cpi+
                  debt_gdp+i_lend+fdi_gdp+capital_gdp+labor_growth+
                  gdp_energy+power_losses+patents_100000+trend,data=df)
  summary(static_lm)
}
  

static_transform_model <-function(df){
  
}

lag_linear_model <- function(df){
  df<-slide(df,Var="debt_gdp",NewVar="debt_gdp_lag",slideBy=-1)
  lag_lm<-lm(gdp_growth ~ gdp_cap+unemployment+inflation_cpi+
                  debt_gdp_lag+i_lend+fdi_gdp+capital_gdp+labor_growth+
                  gdp_energy+power_losses+patents_100000+trend,data=df)
  summary(lag_lm)
}

lag_transform_model <- function(df){
  
}

static_linear_model(armenia)
lag_linear_model(armenia)
