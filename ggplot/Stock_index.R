library(gdata)
## Read the original Excel sheet as is  ##
index_data <-read.xls('./data_science_homework/ggplot/data_akbilgic.xlsx',sheet=1)

## Add Two new Columns  ##
index_data["Date_readable"] <- NA
index_data["weekday"] <- NA

## Add Values to new columns ##
  # The dates in the orinal excel sheet are in some numeric format ..I think epoc date #

index_data$Date_readable <- as.Date(index_data$date, origin="1899-12-30")
index_data$weekday <- weekdays(index_data$Date_readable)

## get Index values for Monday and Friday Only ##
mon_fri_mkt <-subset(index_data , index_data$weekday=="Monday"|index_data$weekday=="Friday")

## plot the vlaues in a Bar-graph ##
ggplot(data = mon_fri_mkt ) +
  aes(x= Date_readable , y =FTSE ) + 
  xlab("Dates") + ylab("Index Value")+ ggtitle("Monday Effect OR Weekend Effect") +
  geom_bar(colour="black",  
           aes(fill=weekday),
           stat="identity",
           position=position_dodge()
           )



