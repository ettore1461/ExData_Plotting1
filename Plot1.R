filename<- "household_power_consumption.txt"

xx<- read.table(filename,sep = ";", header = TRUE, dec = ".",
                 colClasses = c("factor","factor","numeric",
                                 "numeric","numeric","numeric","numeric",
                                 "numeric","numeric"),na.strings = "?")
format<- "%d/%m/%Y"
xx$Date<- as.Date(strptime(xx$Date,format = format))

Data<- subset(xx,subset = (xx$Date>=as.Date("2007-02-01")&
                                             xx$Date<=as.Date("2007-02-02")))

hist(Data$Global_active_power,xlab = "Global Active Power (kilowatts)",
     col = "red",main = "Global Active Power")