##Import data
data<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = FALSE)

##select days to analyse
sub<-subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

##create daytime column
dt<-strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##set par
par(mfcol=c(2,2))

##create plots
#1
plot(dt, sub$Global_active_power, type="l", ylab="Global Active Power", xlab="")
#2
plot(dt, sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(dt, sub$Sub_metering_2, type="l", col="red")
points(dt, sub$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#3
plot(dt, sub$Voltage, type="l", xlab="datetime", ylab="Voltage")
#4
plot(dt, sub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

##save plot as png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()