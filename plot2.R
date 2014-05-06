# Importing data
elec_file <- file("household_power_consumption.txt")
data <- read.table(elec_file, header = TRUE, sep = ";")

# Subsetting
data_subset <- data[((data$Date == "1/2/2007") | (data$Date == "2/2/2007")),]

# Changing date and time formats
data_subset$DateTime <- paste(data_subset$Date, data_subset$Time, sep = "-") 
data_subset$DateTime <- strptime(data_subset$DateTime,format = "%d/%m/%Y-%H:%M:%S")

# Changing formats 
data_subset$Global_active_power <- as.numeric(as.character(data_subset$Global_active_power))
data_subset$Global_reactive_power <- as.numeric(as.character(data_subset$Global_reactive_power))
data_subset$Sub_metering_1 <- as.numeric(as.character(data_subset$Sub_metering_1))
data_subset$Sub_metering_2 <- as.numeric(as.character(data_subset$Sub_metering_2))
data_subset$Sub_metering_3 <- as.numeric(as.character(data_subset$Sub_metering_3))
data_subset$Voltage <- as.numeric(as.character(data_subset$Voltage))

# Plot 2
png(filename = "plot2.png", width = 480, height = 480)
Sys.setlocale("LC_TIME", "en_US")
plot(data_subset$DateTime, data_subset$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)",xlab="")
Sys.setlocale("LC_TIME", "fr_FR")
dev.off()
