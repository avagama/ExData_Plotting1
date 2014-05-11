#Plot2
library(sqldf)
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "./data/household_power_consumption.txt"
myData <- read.csv2.sql(myFile,mySql)

DateTimeChr = paste(myData$Date,myData$Time)
DateTime = strptime(DateTimeChr, "%d/%m/%Y %H:%M:%S")
str(DateTime)
class(DateTime)

#Plot2
par(mfrow = c(1,1), mar = c(5, 5, 5, 2))
with(myData, plot(DateTime, Global_active_power, type="l", 
                  xlab = "datetime", ylab = "Global Active Power (kilowatts)"))
## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png")  
dev.off()