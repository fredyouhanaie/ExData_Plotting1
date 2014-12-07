
# read the file
hpc0 <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", as.is=TRUE)

# create a proper date/time vector
DateTime <- strptime(paste(hpc0$Date, hpc0$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# create a new frame with the proper date/time column
hpc1 <- cbind(DateTime, hpc0)

# we are only interested in the 2 specific days
hpc2 <- hpc1[hpc1$DateTime >= "2007-02-01" & hpc1$DateTime < "2007-02-03",]

# plot the data
png(filename="plot1.png")
hist(hpc2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
