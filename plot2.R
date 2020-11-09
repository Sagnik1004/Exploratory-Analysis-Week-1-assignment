library(lubridate)

#reading the dataset for the assignment into R
d1<- read.table('household_power_consumption.txt', sep = ';', header = TRUE)

d1$Date<- dmy(d1$Date)#changing the class of the 'Date' column into Date class
d1<- d1[grep('^2007-02-01|^2007-02-02', d1$Date),]#subsetting the dataset and keeping only the 2 dates 2007-02-01 and 2007-02-02 as required for this assignment

d1$Global_active_power<- as.numeric(d1$Global_active_power)#changing the class of the variable Global_active_power to numeric

d1$datetime<- paste(d1$Date, d1$Time)#combining the date and time columns into one column called datetime
d1$datetime<- ymd_hms(d1$datetime)#setting the new column datetime as a date variable
png(filename = 'plot2.png') #creating the PNG file plot2

#now creating our plot
plot(d1$datetime, d1$Global_active_power, type = 'l', xlab = 'Date and time', ylab = 'Global Active Power (kilowatts)')
dev.off()