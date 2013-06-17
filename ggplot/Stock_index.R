library(gdata)
## Read the original Excel sheet as is  ##
index_data <-read.xls('./data_akbilgic.xlsx',sheet=1)

## Add two new columns : Readable dates and the day of the week

index_data$Date_readable <- as.Date(index_data$date, origin="1899-12-30")
index_data$weekday <- weekdays(index_data$Date_readable)

## get Index values for Monday and Friday Only ##
mon_fri_mkt <-subset(index_data , index_data$weekday=="Monday"|index_data$weekday=="Friday")

## plot the vlaues in a Bar-graph ##
ggplot(data = mon_fri_mkt ) +
  aes(x= Date_readable , y =FTSE ) + 
  xlab("Dates") + ylab("Index Value:FTSE 100")+ ggtitle("Monday Effect OR Weekend Effect") +
  geom_bar(  
           aes(fill=weekday),
           stat="identity",
           position=position_dodge() 
           )+theme_bw()



