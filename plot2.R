source( "assignmentLibrary.R" )

targetFile <- "plot2.png"

# start by initializing the data and directories (from assignmentLibrary.R)
initializeData()

# Open the PNG file for writing
openTarget( targetFile )

# output the plot of GAP over time
plot( rawData$TimeStamp , rawData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" )

# close the device
dev.off()