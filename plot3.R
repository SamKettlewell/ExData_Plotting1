#Load the dataset and extract the relevant days. Costs 262MB of RAM and about 1 minute to load in. Only read it once!
if(!exists("power_data")) {
  power_data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE)
  power_data <- power_data[which(power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007"), ]
}

#plot 3
datetime <- strptime(paste(power_data$Date, power_data$Time), "%d/%m/%Y %H:%M:%S")
sub_one <- as.numeric(levels(power_data$Sub_metering_1))[power_data$Sub_metering_1]
sub_two <- as.numeric(levels(power_data$Sub_metering_2))[power_data$Sub_metering_2]
sub_three <- power_data$Sub_metering_3 #this is unique

png("plot3.png", width = 480, height = 480)
plot(datetime, sub_one, type = "l", xlab = "", ylab = "Energy sub metering")
points(datetime, sub_two, col = "red", type = "l")
points(datetime, sub_three, col = "blue", type = "l")
legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()