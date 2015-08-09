library(data.table)
Sys.setlocale("LC_TIME", locale="English")

dt <- read.table("household_power_consumption.txt", 
                 skip=66637, nrows=2880, sep=";", na.strings="?")
header <- read.table("household_power_consumption.txt", 
                     nrows=1, sep=";", na.strings="?", header=TRUE)
setnames(dt, names(dt), names(header))
dt$datetime <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480, res=72)

plot(dt$datetime, dt$Sub_metering_1, 
     type="l",
     xlab = "",
     ylab = "Energy sub metering")
lines(dt$datetime, dt$Sub_metering_2, col="red")
lines(dt$datetime, dt$Sub_metering_3, col="blue")
legend("topright", lty="solid", col = c("black","red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_1", "Sub_metering_3"))

dev.off()
