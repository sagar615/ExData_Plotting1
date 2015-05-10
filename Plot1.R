#Loading raw data into R
dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Changing character data in column data to actual Date
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

#Filtering data from the dates 2007-02-01 and 2007-02-02 only
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Plotting
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#saving it to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file="Plot1.png", height = 480, width = 480)
dev.off()
