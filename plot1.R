# Plot1

# Using SQL read only the required data from the large data file 
library(sqldf)
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "./data/household_power_consumption.txt"
myData <- read.csv2.sql(myFile,mySql)

# Changing Date and Time format from charector to strptime()
DateTimeChr = paste(myData$Date,myData$Time)
DateTime = strptime(DateTimeChr, "%d/%m/%Y %H:%M:%S")



# Create Plot1
str(myData)
par(mfrow = c(1,1), mar = c(5, 5, 5, 2))
hist(myData$Global_active_power, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)")

# Copy Plot1 to PNG
dev.copy(png, file = "plot1.png")  ## Copy my plot to a PNG file
dev.off()