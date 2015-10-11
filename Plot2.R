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

plot(Data$Date.new,Data$Global_active_power, type ="l",
     xlab = "",ylab = "Global Active Power (kilowatts)")