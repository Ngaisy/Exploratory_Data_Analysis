dataSou <- "./household_power_consumption.txt"

data <- data <- read.table(dataSou, header = TRUE, sep=";", 
                           stringsAsFactors=FALSE, dec = ".")

subSetData <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))
datatime <- strptime(paste(subSetData$Date, subSetData$Time, sep =" "),
                     "%d/%m?%Y %H:%M:%S")

GlobalActivePower <- as.numeric(subSetData$Global_active_power)
Voltage <- as.numeric(subSetData$Voltage)
EnergySubMetering1 <- as.numeric(subSetData$Sub_metering_1)
EnergySubMetering2 <- as.numeric(subSetData$Sub_metering_2)
EnergySubMetering3 <- as.numeric(subSetData$Sub_metering_3)
GlobalReactivePower <- as.numeric(subSetData$Global_reactive_power)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(datetime, GlobalActivePower, type = "l", xlab = "", ylab =  "Global Active Power")
plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(datetime, EnergySubMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, EnergySubMetering2, type = "l", col = "red")
lines(datetime, EnergySubMetering3, type = "l", col = "blue")
plot(datetime, GlobalReactivePower, type = "l", xlab = "", ylab = "Global_reactive_power")

dev.off()