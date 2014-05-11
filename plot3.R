#Plot3
library(sqldf)
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "./data/household_power_consumption.txt"
myData <- read.csv2.sql(myFile,mySql)

DateTimeChr = paste(myData$Date,myData$Time)
DateTime = strptime(DateTimeChr, "%d/%m/%Y %H:%M:%S")
str(DateTime)
class(DateTime)

#Plot3
par(mfrow = c(1,1), mar = c(5, 5, 5, 2))
with(myData, plot(DateTime, Sub_metering_1, type="l", 
                  xlab = "datetime", ylab = "Energy sub metering"))
with(subset(myData), points(DateTime, Sub_metering_3, col = "blue", type="l"))
with(subset(myData), points(DateTime, Sub_metering_2, col = "red", type="l"))
legend("topright", cex = 0.7 , lty = 1,text.width = 50000,
       col = c("black", "red", "blue"), y.intersp=.5,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "plot3.png")  ## Copy my plot to a PNG file
dev.off()