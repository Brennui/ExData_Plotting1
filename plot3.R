power_data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
dates <- c("1/2/2007","2/2/2007")
TD <- power_data[power_data$Date %in% dates,]
good <- complete.cases(TD)
TD <- TD[good,]
x <- as.POSIXct(paste(TD$Date, TD$Time), format= "%d/%m/%Y %H:%M:%S")
plot(x,as.numeric(TD$Sub_metering_1),"l",xlab = "",ylab = "Energy sub metering")
lines(x,as.numeric(TD$Sub_metering_2),"l",col="red")
lines(x,as.numeric(TD$Sub_metering_3),"l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
dev.copy(png, file = "plot3.png")
dev.off()
