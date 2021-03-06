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