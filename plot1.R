##Import data
data<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

##select days to analyse
sub<-subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

##create histogram (plot1)
hist(sub$Global_active_power, 
     col="red", xlab="Global Active Power (kilowatts)", 
     main = "Global Active Power")

##save plot as png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()