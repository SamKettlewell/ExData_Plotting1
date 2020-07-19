#Load the dataset and extract the relevant days. Costs 262MB of RAM and about 1 minute to load in. Only read it once!
if(!exists("power_data")) {
  power_data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE)
  power_data <- power_data[which(power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007"), ]
}

global_active_power <- as.numeric(levels(power_data$Global_active_power))[power_data$Global_active_power]
png("plot1.png", width = 480, height = 480)
hist(global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()