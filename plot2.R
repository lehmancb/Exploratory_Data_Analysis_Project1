## Set the WD
setwd("\\\\CVGFNP004/Cincinnati/Home/MyDocs/Coursera/Exploratory_Data_Analysis/Week1")

## Read in Data
EPCfull <- read.csv("./Data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

## Convert column to date
EPCfull$Date <- as.Date(EPCfull$Date, format = "%d/%m/%Y")

## Subset full data set 
EPCsub <- subset(EPCfull, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Change canvas
png('plot2.png', width = 480, height = 480)

## Create Plot
with(EPCsub, plot(Global_active_power ~ as.POSIXct(paste(Date, Time)), type = "l", xlab="", ylab="Global Active Power (kilowatts)"))

## Clear session and cleanup
dev.off()
rm(EPCfull, EPCsub)
