# Url at which the data set is located
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# Download zip file
download.file(fileUrl, destfile="household_power_consumption.zip", method="curl")
# Read data set. Call the data frame "powerConsumption"
powerConsumption <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"),header=T, sep=";")

# Household power consumption for Feb. 1 and 2, 2007 only
validDataSet <- powerConsumption[as.character(powerConsumption$Date) %in% c("1/2/2007", "2/2/2007"),]
png(file="plot1.png")
hist(as.numeric(as.character(validDataSet$Global_active_power)), main="Global Active Power", xlab="Global Active Power (kilowatts)", c="red")
dev.off()

