library(ggplot2)
library(readxl)
library(reshape2)
#read data and convert 
data <- data.frame(read_excel("transition indicators_EBRD_1999-2004_small.xls"))
data_melted <- melt(data,id.vars=c("country","year"))
data_melted$variable <- as.character(data_melted$variable)
data_melted$value <- as.numeric(data_melted$value)
#Price Liberalisation
price_lib <- subset(data_melted, variable=="Price.liberalisation.")
plot<-ggplot(data=price_lib,aes(x=year,y=value,shape=country,group=country))+
  geom_line()+
  geom_point()+
  theme(plot.title = element_text(hjust=0.5))+
  labs(shape="Country",x="Year",y="Price liberalization",title = "Price Liberalisation by Year" )
plot

#Roads
roads <- subset(data_melted, variable=="Roads.")
plot<-ggplot(data=roads,aes(x=year,y=value,shape=country,group=country))+
  geom_line()+
  geom_point()+
  theme(plot.title = element_text(hjust=0.5))+
  labs(shape="Country",x="Year",y="Roads",title = "Roads by Year" )
plot

#financial markets
trade <- subset(data_melted, variable == "Trade...Forex.system.")
banking <- subset(data_melted, variable == "Banking.reform...interest.rate.liberalisation.")
securities <- subset(data_melted, variable == "Securities.markets...non.bank.financial.institutions.")
lib <- subset(data_melted, variable == "Price.liberalisation.")
financial <- data.frame(trade$year,trade$country,banking$value,securities$value,trade$value,lib$value)
financial$sum <- (financial$banking.value+financial$securities.value+financial$trade.value+financial$lib.value)
financial$average <- financial$sum

plot<-ggplot(data=financial,aes(x=trade.year,y=average,shape=trade.country,group=trade.country))+
  geom_line()+
  geom_point()+
  theme(plot.title = element_text(hjust=0.5))+
  scale_y_continuous("Financial Measurement",c(1:20))+
  labs(shape="Country",x="Year",y="Financial Measurement",title = "Composite Financial Measurement" )
plot

