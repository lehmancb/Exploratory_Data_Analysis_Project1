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
png('plot4.png', width = 480, height = 480)

##Change Canvas Size
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

##PLOTS
with(EPCsub, {
  ## Create Plot1
  plot(Global_active_power~DateTime, type = "l", ylab = "Global Active Power", xlab = "")
  
  ## Create Plot2
  plot(Voltage~DateTime, type = "l")

  ## Create Plot3
  plot(Sub_metering_1 ~ DateTime, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2 ~ DateTime, col = "Red")
  lines(Sub_metering_3 ~ DateTime, col = "Blue")
  ## Add legend
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  ## Create Plot4
  plot(Global_reactive_power~DateTime, type = "l")
})
  
## Clear session and cleanup
dev.off()
rm(EPCfull, EPCsub)
