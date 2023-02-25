#reading data
data<-read.csv("power_consumption.txt",header=TRUE,sep=";",nrows=2075259, na.strings="?",check.names=F, stringsAsFactors=FALSE, comment.char="", quote="\"")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subsetting in dates
subdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
#dates formats
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

#plot with legends
with(subdata,plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab=""),
     lines(Sub_metering_2~Datetime,col="red"),
     lines(Sub_metering_3~Datetime,col="blue"))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# saving in png file
dev.copy(png,file="plot3.png")