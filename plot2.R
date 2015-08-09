library(data.table)
Sys.setlocale("LC_TIME", locale="English")
dt <- read.table("household_power_consumption.txt", 
                 skip=66637, nrows=2880, sep=";", na.strings="?")
header <- read.table("household_power_consumption.txt", 
                     nrows=1, sep=";", na.strings="?", header=TRUE)
setnames(dt, names(dt), names(header))
dt$datetime <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")

plot(dt$datetime, dt$Global_active_power, 
     type="l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", width=480, height=480, res=72)
dev.off()
