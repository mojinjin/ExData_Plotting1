data <- read.table("household_power_consumption.txt",header = T, sep = ";")
names <- colnames(data)
data <- read.table("household_power_consumption.txt",header = T, sep = ";", skip = 66636, nrows = 2880, col.names = names)
data$DT <- strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))
plot(data$DT, data[,3],type = "n", ylab = "Global Active Power", xlab = "")
lines(data$DT, data[,3])

plot(data$DT, data$Voltage,type = "n", ylab = "Voltage", xlab = "datetime")
lines(data$DT, data$Voltage)

plot(data$DT, data[,7], type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$DT, data[,7], col ="black")
lines(data$DT, data[,8], col = "red")
lines(data$DT, data[,9], col = "blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1     ", "Sub_metering_2     ", "Sub_metering_3     ")£¬bty = "n")

plot(data$DT, data[,4],type = "n", ylab = "Global_reactive_power", xlab = "datetime")
lines(data$DT, data[,4])

dev.copy(png, "plot4.png", width = 480, height = 480, units = "px")
dev.off()