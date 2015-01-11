###### draw data from household_power_consumption.txt 
newdata <- read.table("household_power_consumption.txt", sep=";", header = T, stringsAsFactors = FALSE)
newdata$Date <- as.Date(newdata$Date,"%d/%m/%Y")
mydata<-subset(newdata, newdata$Date=="2007-2-1"|newdata$Date =="2007-2-2")
mydata[,3:8] <- sapply(mydata[,3:8], as.numeric)

mydata$Time <- paste(mydata$Date, mydata$Time)
mydata$Time <- as.POSIXct(mydata$Time)

###### make plot3
png("plot3.png", width = 480, height = 480)
with(mydata, plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(mydata, lines(Time, Sub_metering_2, col = "red", type = "l", xlab = "", ylab = NULL), add = TRUE)
with(mydata, lines(Time, Sub_metering_3, col = "blue", type = "l", xlab = "", ylab = NULL), add = TRUE)
legend("topright", col=c("black", "red", "blue"), lwd = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()