#reading data
data<-read.csv("power_consumption.txt",header=TRUE,sep=";",nrows=2075259, na.strings="?",check.names=F, stringsAsFactors=FALSE, comment.char="", quote="\"")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#multiples plots
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(subdata$Global_active_power~subdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(subdata$Voltage~subdata$Datetime, type="l", ylab="Voltage (volt)", xlab="")
plot(subdata$Sub_metering_1~subdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(subdata$Sub_metering_2~subdata$Datetime,col="red")
lines(subdata$Sub_metering_3~subdata$Datetime,col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(subdata$Global_reactive_power~subdata$Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")

# saving in png file
dev.copy(png,file="plot4.png")
dev.off()