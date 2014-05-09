source( "assignmentLibrary.R" )

targetFile <- "plot1.png"

# start by initializing the data and directories (from assignmentLibrary.R)
initializeData()

# Open the PNG file for writing
openTarget( targetFile )

# output the histogram
hist( rawData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )

# close the device
dev.off()