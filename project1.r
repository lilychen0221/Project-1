###### draw data from household_power_consumption.txt 
newdata <- read.table("household_power_consumption.txt", sep=";", header = T, stringsAsFactors = FALSE)
newdata$Date <- as.Date(newdata$Date,"%d/%m/%Y")
mydata<-subset(newdata, newdata$Date=="2007-2-1"|newdata$Date =="2007-2-2")
mydata[,3:8] <- sapply(mydata[,3:8], as.numeric)

mydata$Time <- paste(mydata$Date, mydata$Time)
mydata$Time <- as.POSIXct(mydata$Time)


###### make plot1
png("plot1.png", width = 480, height = 480)
hist(mydata$Global_active_power,col="red",main = "Global Active Power", 
         xlab = "Global Active Power (killowatts)")
dev.off()

###### make plot2
png("plot2.png", width = 480, height = 480)
plot(mydata$Time, mydata$Global_active_power,type = "l", xlab =" ",ylab = "Global Active Power (killowatts)")
dev.off()

###### make plot3
png("plot3.png", width = 480, height = 480)
with(mydata, plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(mydata, lines(Time, Sub_metering_2, col = "red", type = "l", xlab = "", ylab = NULL), add = TRUE)
with(mydata, lines(Time, Sub_metering_3, col = "blue", type = "l", xlab = "", ylab = NULL), add = TRUE)
legend("topright", col=c("black", "red", "blue"), lwd = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

###### make plot4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,4))
with(mydata, {
  plot(Time, Global_active_power, type = "l", ylab = "Global Active Power ")
  plot(Time, Global_active_power,type = "l", xlab ="datetime",ylab = "Voltage")
  plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(Time, Sub_metering_2, col = "red", type = "l", xlab = "", ylab = NULL)
  lines(Time, Sub_metering_3, col = "blue", type = "l", xlab = "", ylab = NULL)
  legend("topright", col=c("black", "red", "blue"), lwd = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Time, Global_reactive_power, xlab= "datetime",type = "l")
})
dev.off()

