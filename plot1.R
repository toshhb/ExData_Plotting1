library(data.table)
dt<-fread("household_power_consumption.txt", na.strings="?", showProgress=T)
dts<-dt[dt$Date=="1/2/2007" | dt$Date=="2/2/2007"]

png(file = "plot1.png", bg = "transparent")
hist(as.numeric(dts$Global_active_power), main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")

#DT <- fread("sed '1p;/^[12]\\/2\\/2007/!d' household_power_consumption.txt", na.strings = c("?", ""))
#with(DT, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))

#dev.copy(png, file = "plot1.png", bg = "transparent")
dev.off()
