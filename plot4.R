#Plot4
library(sqldf)
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "./data/household_power_consumption.txt"
myData <- read.csv2.sql(myFile,mySql)

DateTimeChr = paste(myData$Date,myData$Time)
DateTime = strptime(DateTimeChr, "%d/%m/%Y %H:%M:%S")
str(DateTime)
class(DateTime)

#Plot4
par(mfrow = c(2, 2))
with(myData, plot(DateTime, Global_active_power, type="l", 
                  xlab = "datetime", ylab = "Global Active Power"))

with(myData, plot(DateTime, Voltage, type="l", xlab = "datetime", ylab = "Voltage"))

with(myData, plot(DateTime, Sub_metering_1, type="l", 
                  xlab = "datetime", ylab = "Energy sub metering"))
with(subset(myData), points(DateTime, Sub_metering_3, col = "blue", type="l"))
with(subset(myData), points(DateTime, Sub_metering_2, col = "red", type="l"))
legend("topright", cex = 0.5 , lty = 1, bty = "n",
       col = c("black", "red", "blue"), text.width = 60000, y.intersp=0.2,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(myData, plot(DateTime, Global_reactive_power, type="l", 
                  xlab = "datetime", ylab = "Global reactive Power"))

dev.copy(png, file = "plot4.png")  ## Copy my plot to a PNG file
dev.off()
