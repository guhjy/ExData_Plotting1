setwd('/Volumes/NO NAME/classes/Hopkins/ExploratoryDataAnalysis')
library(data.table)

lines <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))
hpc <- read.table(file = "household_power_consumption.txt",
                  sep = ";",
                  skip = 66637,
                  nrows = 2880)

png("plot3.png", width = 480, height = 480)

colnames(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
 
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), format='%d/%m/%Y %H:%M:%S')
plot(hpc$datetime, hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpc$datetime, as.numeric(as.character(hpc$Sub_metering_2)), type = "l", col = "red")
lines(hpc$datetime, as.numeric(as.character(hpc$Sub_metering_3)), type = "l", col = "blue")
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

