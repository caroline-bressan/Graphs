#reading data
data<-read.csv("power_consumption.txt",header=TRUE,sep=";",nrows=2075259, na.strings="?",check.names=F, stringsAsFactors=FALSE, comment.char="", quote="\"")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subsetting in dates
subdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
#dates formats
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

#plot
plot(subdata$Global_active_power~subdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# saving in png file
dev.copy(png,file="plot1.png")