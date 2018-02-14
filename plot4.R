###Exploratory Analysis Week 1 Assignment

##Cleaninig the Data, eliminating rows with "?" and filtering by the required date interval
epc<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors = FALSE,na.strings = "?")
epc_no_na<-epc[!is.na(epc),]
epc1<-subset(epc_no_na,epc_no_na$Date=="1/2/2007")
epc2<-subset(epc_no_na,epc_no_na$Date=="2/2/2007")
epc_final<-rbind(epc1,epc2)

##Setting the graphing device, plots arrangement and Date formatting
png("plot4.png",width=480,height=480,type="windows")
par(mfrow = c(2, 2))
date_final<-strptime(paste(epc_final$Date,epc_final$Time),format="%d/%m/%Y %H:%M:%S",tz="")

## Plot 1
gap<-as.numeric(epc_final$Global_active_power)
plot(date_final,gap,type="l",col="black",xlab="",ylab="Global Active Power (kilowatts)")

## Plot 2
volt<-as.numeric(epc_final$Voltage)
plot(date_final,volt,type="l",col="black", xlab="datetime",ylab="Voltage")

## Plot 3
esm1<-as.numeric(epc_final$Sub_metering_1)
esm2<-as.numeric(epc_final$Sub_metering_2)
esm3<-as.numeric(epc_final$Sub_metering_3)
plot(date_final,esm1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(date_final,esm2,col="red")
lines(date_final,esm3,col="blue")
legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

## Plot 4
grp<-as.numeric(epc_final$Global_reactive_power)
plot(date_final,grp,type="l",col="black", xlab="datetime",ylab="Global_reactive_power")

dev.off(dev.cur())




