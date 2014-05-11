d <- read.csv("household_power_consumption.txt", na.strings="?", sep=";", skip=66637, nrows=2880, 
              header=FALSE, col.names=c("sDate","sTime", "global_active_powe", "global_reactive_power", 
                                        "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", 
                                        "sub_metering_3"))
d$timestamp = strptime(paste(d$sDate, d$sTime, sep =" "), format="%d/%m/%Y %H:%M:%S")

png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2, 2), cex=0.65)
plot(d$timestamp, d$global_active_powe, ylab="Global Active Power (kilowatts)", xlab="",  type="l")
plot(d$timestamp, d$voltage, ylab="Voltage", xlab="", type="l")
plot(d$timestamp, d$sub_metering_1, ylab="Energy sub metering", xlab="",  type="l")
lines(x=d$timestamp, y=d$sub_metering_2, type="l", col="red")
lines(x=d$timestamp, y=d$sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  
       bty="n", lty=1, col=c("black", "red", "blue"))
plot(d$timestamp, d$global_reactive_power, xlab="", type="l")
dev.off()
par(mfcol=c(1,1))
