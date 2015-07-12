## Read Data
dataSou <- "./household_power_consumption.txt"
## Format the data 
data <- read.table(dataSou, header = TRUE, sep=";", 
                   stringsAsFactors=FALSE, dec = ".")
## Extract the target session
subSetData <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

## Read data and time
  datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "),
                       "%d/%m/%Y %H:%M:%S")
## Read Data of submetering
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

## Open a png graph device
png("plot3.png", width=480, height=480)
## Make a histogram 
plot(datetime, subMetering1, type = "l", ylab="Energy sub metering",xlab="")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd =2, col=c("black", "red", "blue"))
## Shut down the device
dev.off()