#plot3.R
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
png(filename="plot3.png")
plot(energyData$time, energyData$sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(energyData$time, energyData$sub_metering_1, type = "l", col="black")
lines(energyData$time, energyData$sub_metering_2, type = "l", col="red")
lines(energyData$time, energyData$sub_metering_3, type = "l", col="blue")
legend(x="topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=c(1,1,1))
dev.off();