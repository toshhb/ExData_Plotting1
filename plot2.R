library(data.table)
dt<-fread("household_power_consumption.txt", na.strings="?", showProgress=T)
dts<-dt[dt$Date=="1/2/2007" | dt$Date=="2/2/2007"]

Sys.setlocale("LC_TIME", "en_US.UTF-8")
png(file = "plot2.png", bg = "transparent")
with(dts, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),
               as.numeric(Global_active_power), type="l", 
               ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
