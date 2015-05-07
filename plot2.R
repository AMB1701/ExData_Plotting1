#plot2.R
#load energyData
if(!exists("energyData"))
{
  energyData <- read.table("household_power_consumption.txt", na.string="?", stringsAsFactors=FALSE, sep=";", header=TRUE)
  colnames(energyData) <- tolower(colnames(energyData))
  energyData$time <- strptime(paste(energyData$date,energyData$time),"%d/%m/%Y %H:%M:%S")
  energyData <- energyData[,2:ncol(energyData)]
  energyData <- energyData[energyData$time>=as.POSIXlt("2007-02-01")&energyData$time<=as.POSIXlt("2007-02-03"),]
  energyData <- na.omit(energyData)
}

#draw plot as PNG
png(filename="plot2.png")
plot(energyData$time, energyData$global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
lines(energyData$time, energyData$global_active_power, type = "l")
dev.off();