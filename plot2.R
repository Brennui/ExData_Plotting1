power_data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
dates <- c("1/2/2007","2/2/2007")
TD <- power_data[power_data$Date %in% dates,]
good <- complete.cases(TD[TD$Global_active_power,])
TD <- TD[good,]
x <- as.POSIXct(paste(TD$Date, TD$Time), format= "%d/%m/%Y %H:%M:%S")
y <- as.numeric(TD$Global_active_power)
plot(x,y,"l",ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()
