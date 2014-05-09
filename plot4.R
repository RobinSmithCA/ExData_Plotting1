source( "assignmentLibrary.R" )

targetFile <- "plot4.png"

# start by initializing the data and directories (from assignmentLibrary.R)
initializeData()

# Open the PNG file for writing
openTarget( targetFile )

# this will be a 2 x 2 with 4 total graphs.
par( mfrow = c( 2, 2 ) )

plot( rawData$TimeStamp , rawData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" )

plot( rawData$TimeStamp , rawData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage" )

plot( rawData$TimeStamp , rawData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering" )
points( rawData$TimeStamp , rawData$Sub_metering_2, type = "l", col = "red" )
points( rawData$TimeStamp , rawData$Sub_metering_3, type = "l", col = "blue" )
legend( "topright", cex = .9, bty = "n", lwd = 2.0, col = c( "black", "red", "blue" ), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ) )

plot( rawData$TimeStamp , rawData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power" )

# close the device
dev.off()