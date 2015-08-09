library(data.table)
Sys.setlocale("LC_TIME", locale="English")

dt <- read.table("household_power_consumption.txt", 
                 skip=66637, nrows=2880, sep=";", na.strings="?")
header <- read.table("household_power_consumption.txt", 
                     nrows=1, sep=";", na.strings="?", header=TRUE)
setnames(dt, names(dt), names(header))
dt$datetime <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480, res=72)
par(mfrow = c(2,2))

plot(dt$datetime, dt$Global_active_power, 
     type="l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

plot(dt$datetime, dt$Voltage, 
     type="l",
     xlab = "datetime",
     ylab = "Voltage")

plot(dt$datetime, dt$Sub_metering_1, 
     type="l",
     xlab = "",
     ylab = "Energy sub metering")
lines(dt$datetime, dt$Sub_metering_2, col="red")
lines(dt$datetime, dt$Sub_metering_3, col="blue")
legend("topright", lty="solid", col = c("black","red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_1", "Sub_metering_3"))

plot(dt$datetime, dt$Global_reactive_power, 
     type="l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
