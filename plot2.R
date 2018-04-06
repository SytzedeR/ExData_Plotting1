##Import data
data<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = FALSE)

##select days to analyse
sub<-subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

##create daytime column
dt<-strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##create plot
plot(dt, sub$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab="")

##save plot as png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()