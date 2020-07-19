#Load the dataset and extract the relevant days. Costs 262MB of RAM and about 1 minute to load in. Only read it once!
if(!exists("power_data")) {
  power_data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE)
  power_data <- power_data[which(power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007"), ]
}

png("plot4.png", width = 480, height = 480)
par("mfrow" = c(2,2))

#upper left
global_active_power <- as.numeric(levels(power_data$Global_active_power))[power_data$Global_active_power]
datetime <- strptime(paste(power_data$Date, power_data$Time), "%d/%m/%Y %H:%M:%S")
plot(datetime, global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#upper right
voltage <- as.numeric(levels(power_data$Voltage))[power_data$Voltage]
plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#lower left
sub_one <- as.numeric(levels(power_data$Sub_metering_1))[power_data$Sub_metering_1]
sub_two <- as.numeric(levels(power_data$Sub_metering_2))[power_data$Sub_metering_2]
sub_three <- power_data$Sub_metering_3 #this is unique

plot(datetime, sub_one, type = "l", xlab = "", ylab = "Energy sub metering")
points(datetime, sub_two, col = "red", type = "l")
points(datetime, sub_three, col = "blue", type = "l")
legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

#lower right
global_reactive_power <- as.numeric(levels(power_data$Global_reactive_power))[power_data$Global_reactive_power]
plot(datetime, global_reactive_power, type = "l", xlab = "datetime")
dev.off()