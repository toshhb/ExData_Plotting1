library(data.table)
dt<-fread("household_power_consumption.txt", na.strings="?", showProgress=T)
dts<-dt[dt$Date=="1/2/2007" | dt$Date=="2/2/2007"]

png(file = "plot3.png", bg = "transparent")
Sys.setlocale("LC_TIME", "en_US.UTF-8")
with(dts, {
    plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),
         as.numeric(Sub_metering_1),
         type="l", ylab="Energy sub metering", xlab="")
    points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),
           as.numeric(Sub_metering_2), type="l", col="red")
    points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),
           as.numeric(Sub_metering_3), type="l", col="blue")
})

legend("topright", col = c("black", "red", "blue"), lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#dev.copy(png, file = "plot3.png")
dev.off()
