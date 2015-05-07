#plot1.R
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
png(filename="plot1.png")
hist(energyData$global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off();