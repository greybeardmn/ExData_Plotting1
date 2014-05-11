d <- read.csv("household_power_consumption.txt", na.strings="?", sep=";", skip=66637, nrows=2880, 
              header=FALSE, col.names=c("sDate","sTime", "global_active_powe", "global_reactive_power", 
                                        "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", 
                                        "sub_metering_3"))
d$timestamp = strptime(paste(d$sDate, d$sTime, sep =" "), format="%d/%m/%Y %H:%M:%S")

png(filename="plot3.png", height=480, width=480, units="px")
plot(d$timestamp, d$sub_metering_1, ylab="Energy sub metering", xlab="",  type="l")
lines(x=d$timestamp, y=d$sub_metering_2, type="l", col="red")
lines(x=d$timestamp, y=d$sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  lty=1, col=c("black", "red", "blue"))
dev.off()

