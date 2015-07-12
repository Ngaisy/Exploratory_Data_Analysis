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
## Read globalActivePower
globalActivePower <- as.numeric(subSetData$Global_active_power)
## Open a png graph device
png("plot2.png", width=480, height=480)
## Make a histogram 
plot(datetime, globalActivePower, type = "l", 
     ylab="Global Active Power (kilowatts)",xlab="")
## Shut down the device
dev.off()