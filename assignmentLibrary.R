library( "sqldf" )

srcURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
srcZip <- "household_power_consumption.zip"
srcDir <- "."
srcFile <- "household_power_consumption.txt"
targetDir <- "."
targetFile <- "plot.png"

## utility functions
##
## getFilePath - concatenates a directory and file uniformly
getFilePath <- function( dir, ... )
{
   paste( dir, "/", ..., sep = "" )
}

## getSrcFilePath - full file path in source directory
getSrcFilePath <- function( file )
{
   getFilePath( srcDir, file )
}

## getTargetFilePath - full file path in target directory
getTargetFilePath <- function( file )
{
   getFilePath( targetDir, file )
}

## openTarget - opens the target filename for generating our plot output
openTarget <- function( file )
{
   png( filename = getTargetFilePath( file ), bg = "transparent", type = "cairo-png" )
}

## Application functions for either removing repetition or just for readability

## initializeData - Insures that we have the data zip and then it's been extracted
## to the proper directory.  This function also insures that any existing data is
## removed to avoid confusion
initializeData <- function()
{
   ## if we don't have the raw zipped data, go get it
   if ( !file.exists( srcZip ) )
   {
      download.file( srcURL, destfile = srcZip, mode = "wb" )
   }
   
   ## if our raw data source dir hasn't been created yet, then unzip our data there
   if ( !file.exists( getSrcFilePath( srcFile ) ) )
   {
      unzip( srcZip, exdir = srcDir )
   }
   
   if ( file.exists( getTargetFilePath( targetFile ) ) )
   {
      cat( "Removing previous output file: ", targetFile, "\n\n" )
      file.remove( getTargetFilePath( targetFile ) )
   }
   
   ## Read in just the data from 1/2/2007 and 2/2/2007 for our graph.
   rawData <<- read.csv.sql( getSrcFilePath( srcFile ), sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";", comment.char = "" )
   
   ## Convert the individual Date and Time columns into a single Timestamp column of type Date
   rawData$TimeStamp <<- as.POSIXct( paste( rawData$Date, rawData$Time ), format = "%d/%m/%Y %H:%M:%S" )
   
   ## reset the plotter to a 1x1 grid
   par( mfrow = c( 1, 1 ) )
}
