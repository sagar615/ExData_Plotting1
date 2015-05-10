#Loading raw data into R
dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Changing character data in column data to actual Date
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

#Filtering data from the dates 2007-02-01 and 2007-02-02 only
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Dates and Times in separate columns, convert to Datetime
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Plotting

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,  bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.45, pch=21, pt.cex = 1)
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})

#Saving it to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file="Plot4.png", height = 480, width = 480)
dev.off()
