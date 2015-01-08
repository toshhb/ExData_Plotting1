library(data.table)
dt<-fread("household_power_consumption.txt", na.strings="?", showProgress=T)
dts<-dt[dt$Date=="1/2/2007" | dt$Date=="2/2/2007"]

Sys.setlocale("LC_TIME", "en_US.UTF-8")
png(file = "plot4.png", bg = "transparent", width=504, height=504)
par(mfcol = c(2,2))
with(dts, {
    plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),
         as.numeric(Global_active_power), type="l", 
         ylab="Global Active Power", xlab="")

    plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),
               as.numeric(Sub_metering_1),
               type="l", ylab="Energy sub metering", xlab="")
    points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),
                 as.numeric(Sub_metering_2), type="l", col="red")
    points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),
                 as.numeric(Sub_metering_3), type="l", col="blue")
    legend("topright", lwd = 2, col = c("black", "red", "blue"), bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),
          as.numeric(Voltage), type="l",    
          ylab="Voltage", xlab="datetime")
    
    plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),
          Global_reactive_power, type="l", 
          ylab="Global_reactive_power", xlab="datetime")
})

dev.off()
