d <- read.csv("household_power_consumption.txt", na.strings="?", sep=";", skip=66637, nrows=2880, 
              header=FALSE, col.names=c("sDate","sTime", "global_active_powe", "global_reactive_power", 
                                        "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", 
                                        "sub_metering_3"))
d$timestamp = strptime(paste(d$sDate, d$sTime, sep =" "), format="%d/%m/%Y %H:%M:%S")

png(filename="plot1.png", height=480, width=480, units="px")
hist(d$global_active_powe, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
