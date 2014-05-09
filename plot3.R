source( "assignmentLibrary.R" )

targetFile <- "plot3.png"

# start by initializing the data and directories (from assignmentLibrary.R)
initializeData()

# Open the PNG file for writing
openTarget( targetFile )

# output a comparative plot of the sub metering values
plot( rawData$TimeStamp , rawData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering" )
points( rawData$TimeStamp , rawData$Sub_metering_2, type = "l", col = "red" )
points( rawData$TimeStamp , rawData$Sub_metering_3, type = "l", col = "blue" )
legend( "topright", lwd = 2.0, col = c( "black", "red", "blue" ), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ) )

# close the device
dev.off()