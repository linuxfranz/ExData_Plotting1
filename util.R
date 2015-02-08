library(sqldf)
zipfile <- "household_power_consumption.zip"
datafile <- "household_power_consumption.txt"
readData <- function() {
    if (! file.exists(datafile)) {
        if (! file.exists(zipfile)) {
            download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", zipfile, method="curl")
        }
        unzip(zipfile)
    }
    Sys.setlocale(locale="POSIX", category="LC_ALL")
    data <- read.csv2.sql(datafile,"select * from file where Date = '1/2/2007' or Date = '2/2/2007'", na.strings="?")
    data$Time <- paste(data$Date, data$Time)
    data$Time <- strptime(data$Time, format="%d/%m/%Y %H:%M:%S")
    data$Date <- as.Date(data$Date, format="%d/%m/%Y")
    sqldf()
    return(data)
}

