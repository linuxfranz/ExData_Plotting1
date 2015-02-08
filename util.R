library(sqldf)
readData <- function() {
    Sys.setlocale(locale="POSIX", category="LC_ALL")
    data <- read.csv2.sql("household_power_consumption.txt","select * from file where Date = '1/2/2007' or Date = '2/2/2007'", na.strings="?")
    data$Time <- paste(data$Date, data$Time)
    data$Time <- strptime(data$Time, format="%d/%m/%Y %H:%M:%S")
    data$Date <- as.Date(data$Date, format="%d/%m/%Y")
    sqldf()
    return(data)
}

