# Download file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "exdata-data-household_power_consumption.zip", quiet = TRUE)

file <- unzip("exdata-data-household_power_consumption.zip", list = TRUE)
unzip("exdata-data-household_power_consumption.zip")

data <- read.table(as.character(file[1]), header = TRUE, sep = ";", na.strings = "?",
                     colClasses = c("character", "character", rep("numeric", 7)))

# Keep data between 2007-02-01 and 2007-02-02
data$Date <- strptime(data$Date, "%d/%m/%Y")
data <- data[data$Date >= as.POSIXlt("2007-02-01") & data$Date <= as.POSIXlt("2007-02-02"),]

# Plot histogram
par(cex = .75)
hist(data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")