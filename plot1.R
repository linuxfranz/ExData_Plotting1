source("util.R")
data <- readData()
png("plot1.png")
with(data, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))
dev.off()
Sys.setlocale("", category="LC_ALL")
