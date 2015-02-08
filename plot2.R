source("util.R")
data <- readData()
png("plot2.png")
with(data, {
     plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
})
dev.off()
Sys.setlocale("", category="LC_ALL")
