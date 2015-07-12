## Read Data
dataSou <- "./household_power_consumption.txt"
## Format the data 
data <- read.table(dataSou, header = TRUE, sep=";", 
                   stringsAsFactors=FALSE, dec = ".")
## Extract the target session
subSetData <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

## Read globalActivePower
globalActivePower <- as.numeric(subSetData$Global_active_power)
## Open a png graph device
png("plot1.png", width=480, height=480)
## Make a histogram 
hist(globalActivePower, col = "red", main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
## Shut down the device
dev.off()