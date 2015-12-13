power_data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
dates <- c("1/2/2007","2/2/2007")
two_days <- power_data[power_data$Date %in% dates,]
GAP <- two_days["Global_active_power"]
bad <- is.na(GAP)
GAP <- GAP[!bad]
GAP <- as.numeric(GAP)
hist(GAP, col = "red",main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()