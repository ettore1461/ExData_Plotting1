filename<- "household_power_consumption.txt"

xx<- read.table(filename,sep = ";", header = TRUE, dec = ".",
                colClasses = c("factor","factor","numeric",
                               "numeric","numeric","numeric","numeric",
                               "numeric","numeric"),na.strings = "?")
format1<- "%d/%m/%Y %H:%M:%S"
format0<-"%d/%m/%Y"
xx<- cbind(xx,Date.new= 
             strptime(paste(xx$Date,xx$Time),format = format1))
xx$Date<- as.Date(strptime(xx$Date,format = format0))

Data<- subset(xx,subset = (xx$Date>=as.Date("2007-02-01")&
                             xx$Date<=as.Date("2007-02-02")))

## Plotting
par(mfrow=c(2,2))

plot(Data$Date.new,Data$Global_active_power, type ="l",
     xlab = "",ylab = "Global Active Power (kilowatts)")

plot(Data$Date.new,Data$Voltage,xlab = "dataframe",ylab = "Voltage",
     type = "l")

plot(Data$Date.new,Data$Sub_metering_1, type ="l",
     xlab = "",ylab = "Energy sub metering")
lines(Data$Date.new,Data$Sub_metering_2,col="red")
lines(Data$Date.new,Data$Sub_metering_3,col="blue")
legend("topright",lty = 1,col=c("black","red","blue"),
       legend = colnames(Data)[7:9])

plot(Data$Date.new,Data$Global_reactive_power
     ,xlab = "dataframe",
     ylab = "Global_reactive_power",type = "l")