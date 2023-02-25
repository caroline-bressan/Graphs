#reading data
data<-read.csv("power_consumption.txt",header=TRUE,sep=";",nrows=2075259, na.strings="?",check.names=F, stringsAsFactors=FALSE, comment.char="", quote="\"")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subsetting in dates
subdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
#dates formats
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

#histogram
hist(subdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
# saving in png file
dev.copy(png,file="plot1.png")