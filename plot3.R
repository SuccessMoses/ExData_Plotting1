library(dplyr)

#Load the data from the file
data1 <- read.csv('household_power_consumption.csv', 
                  header=TRUE, sep=';', na.strings = '?')

# Create a subset from data that includes only 
# observations we are interested in
subset1 <- subset(data1, Date=='1/2/2007' | Date=='2/2/2007')

# Make variable of Date/Time class using the 'Date' and 'Time' 
subset1 <- transform(subset1, Date= paste(Date, Time))%>%
  transform(Time=NULL)%>%
  transform(Date=strptime(Date, "%d/%m/%Y %H:%M:%S"))

# Make a png file called 'plot3'
png(filename='plot3.png')
with(subset1, plot(Date, Sub_metering_1, type='l', ylab='Energy sub metering'))
with(subset1, lines(Date, Sub_metering_2, type='l', col='red'))
with(subset1, lines(Date, Sub_metering_3, type='l', col='blue'))
legend('topright', legend = 
        c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
          col=c('black', 'red', 'blue'), lty=1)

     
dev.off()