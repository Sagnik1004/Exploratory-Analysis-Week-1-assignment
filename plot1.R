#reading the dataset for the assignment into R
d1<- read.table('household_power_consumption.txt', sep = ';', header = TRUE) 

d1$Date<- dmy(d1$Date) #changing the class of the 'Date' column into Date class
d1<- d1[grep('^2007-02-01|^2007-02-02', d1$Date),] #subsetting the dataset and keeping only the 2 dates 2007-02-01 and 2007-02-02 as required for this assignment
par(mfrow= c(1,1)) #setting mfrow as we need only 1 graph here
#plot 1
d1$Global_active_power<- as.numeric(d1$Global_active_power) #changing the class of the variable Global_active_power to numeric
png(filename = 'plot1.png') #creating the PNG file plot1

#now plotting the histogram
hist(d1$Global_active_power, xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', main = 'Global Active Power')
dev.off()