setwd("C:/Users/ece.o/OneDrive/Coursera/Johns Hopkins University Data Science/04-Exploratory Data Analysis/ExData_Plotting1")

# Download file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "exdata-data-household_power_consumption.zip", quiet = TRUE)

file <- unzip("exdata-data-household_power_consumption.zip", list = TRUE)
unzip("exdata-data-household_power_consumption.zip")

data <- read.table(as.character(file[1]), header = TRUE, sep = ";", na.strings = "?",
                   colClasses = c("character", "character", rep("numeric", 7)))

# Convert to POSIx
data$Time <- strptime(paste(data$Date, data$Time, sep = ":"), "%d/%m/%Y:%H:%M:%S")
data$Date <- strptime(data$Date, "%d/%m/%Y")

# Keep data between 2007-02-01 and 2007-02-02
data <- data[data$Date >= as.POSIXlt("2007-02-01") & data$Date <= as.POSIXlt("2007-02-02"),]

# Plot line chart
par(cex = .75)
plot(data$Time, data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, xjust = 1, yjust = .5, cex = 1)