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

# Make a png file called 'plot2'
png(filename='plot2.png')
with(subset1, plot(Date, Global_active_power, 
                   type='l', 
                   ylab='Global Active Power(kilowatts)'))
dev.off()
