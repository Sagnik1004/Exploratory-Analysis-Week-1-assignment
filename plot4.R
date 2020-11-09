library(lubridate)

#reading the dataset for the assignment into R
d1<- read.table('household_power_consumption.txt', sep = ';', header = TRUE)

d1$Date<- dmy(d1$Date)#changing the class of the 'Date' column into Date class
d1<- d1[grep('^2007-02-01|^2007-02-02', d1$Date),]#subsetting the dataset and keeping only the 2 dates 2007-02-01 and 2007-02-02 as required for this assignment

d1$Global_active_power<- as.numeric(d1$Global_active_power)#changing the class of the variable Global_active_power to numeric

d1$datetime<- paste(d1$Date, d1$Time)#combining the date and time columns into one column called datetime
d1$datetime<- ymd_hms(d1$datetime)#setting the new column datetime as a date variable

png(filename = 'plot4.png')#creating the PNG file plot4
par(mfrow= c(2,2)) #setting mfrow as we need 4 graphs in one screen
par(mar= c(4, 4, 4, 1))
#now creating our plot
#first graph
plot(d1$datetime, d1$Global_active_power, type = 'l', xlab = '' ,ylab = 'Global Active Power (kilowatts)') 
#second graph
plot(d1$datetime, d1$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage') #second graph

#3rd graph
with(d1, plot(x = d1$datetime, y = d1$Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy submetering'))
points(d1$datetime, d1$Sub_metering_1, type = 'h', col= 'black')
points(d1$datetime, d1$Sub_metering_2, type = 'h', col= 'red')
points(d1$datetime, d1$Sub_metering_3, type = 'h', col= 'blue')
legend('topright', pch = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

#Fourth graph
plot(d1$datetime, d1$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'h')
dev.off()