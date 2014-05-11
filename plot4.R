# Url at which the data set is located
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# Download zip file
download.file(fileUrl, destfile="household_power_consumption.zip", method="curl")
# Read data set. Call the data frame "powerConsumption"
powerConsumption <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"),header=T, sep=";", as.is=TRUE)

# Household power consumption for Feb. 1 and 2, 2007 only
validDataSet <- powerConsumption[as.character(powerConsumption$Date) %in% c("1/2/2007", "2/2/2007"),]
validDataSet$dateTime <- strptime(paste(validDataSet$Date,validDataSet$Time), format="%d/%m/%Y %H:%M:%S")

png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2, 2), cex=0.65)
#plot1
plot(validDataSet$dateTime, validDataSet$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#plot2
plot(validDataSet$dateTime, validDataSet$Voltage, type="l", xlab="datetime", ylab="Voltage")
#plot3
plot(validDataSet$dateTime,  validDataSet$Sub_metering_1, type="l", xlab="", ylab="Energy submetering")
lines(validDataSet$dateTime, as.numeric(as.character(validDataSet$Sub_metering_2)), type = "l", col = "red")
lines(validDataSet$dateTime, as.numeric(as.character(validDataSet$Sub_metering_3)), type = "l", col = "blue")
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#plot4
plot(validDataSet$dateTime, validDataSet$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

