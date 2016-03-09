## Set the WD
setwd("\\\\CVGFNP004/Cincinnati/Home/MyDocs/Coursera/Exploratory_Data_Analysis/Week1")

## Read in Data
EPCfull <- read.csv("./Data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

## Convert column to date
EPCfull$Date <- as.Date(EPCfull$Date, format = "%d/%m/%Y")

## Subset full data set 
EPCsub <- subset(EPCfull, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Create Datetime var
EPCsub$DateTime <- with(EPCsub, as.POSIXct(paste(Date, Time)))

## Change canvas
png('plot3.png', width = 480, height = 480)

## Create Plot
with(EPCsub, {
  plot(Sub_metering_1 ~ DateTime, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2 ~ DateTime, col = "Red")
  lines(Sub_metering_3 ~ DateTime, col = "Blue")
  })

## Add legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Clear session and cleanup
dev.off()
rm(EPCfull, EPCsub)
