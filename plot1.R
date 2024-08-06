library(dplyr)

#Load the data from the file
data <- read.csv('household_power_consumption.csv', 
                  header=TRUE, sep=';', na.strings = '?')

# Create a subset from data that includes only 
# observations we are interested in
subset <- subset(data, Date=='1/2/2007' | Date=='2/2/2007')

# Make Date/Time class
subset <- transform(subset, Date= paste(Date, Time))
          %>% transform(Time=NULL)
          %>% transform(Date=strptime(Date, "%d/%m/%Y %H:%M:%S"))

# Make a png file called 'plot1'
png(filename='plot1.png')
with(subset, hist(Global_active_power, 
                  main='Global Active Power', 
                  xlab='Global Active Power(kilowatts)', 
                  ylab='Frequency', 
                  col='red'))
dev.off()