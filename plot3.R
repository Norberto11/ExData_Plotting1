###Exploratory Analysis Week 1 Assignment

##Cleaninig the Data, eliminating rows with "?" and filtering by the required date interval
epc<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors = FALSE,na.strings = "?")
epc_no_na<-epc[!is.na(epc),]
epc1<-subset(epc_no_na,epc_no_na$Date=="1/2/2007")
epc2<-subset(epc_no_na,epc_no_na$Date=="2/2/2007")
epc_final<-rbind(epc1,epc2)

##Plot 3
esm1<-as.numeric(epc_final$Sub_metering_1)
esm2<-as.numeric(epc_final$Sub_metering_2)
esm3<-as.numeric(epc_final$Sub_metering_3)
date_final<-strptime(paste(epc_final$Date,epc_final$Time),format="%d/%m/%Y %H:%M:%S",tz="")
png("plot3.png",width=480,height=480,type="windows")
plot(date_final,esm1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(date_final,esm2,col="red")
lines(date_final,esm3,col="blue")
legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off(dev.cur())


