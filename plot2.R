###Exploratory Analysis Week 1 Assignment

##Cleaninig the Data, eliminating rows with "?" and filtering by the required date interval
epc<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors = FALSE,na.strings = "?")
epc_no_na<-epc[!is.na(epc),]
epc1<-subset(epc_no_na,epc_no_na$Date=="1/2/2007")
epc2<-subset(epc_no_na,epc_no_na$Date=="2/2/2007")
epc_final<-rbind(epc1,epc2)

##Plot 2
gap<-as.numeric(epc_final$Global_active_power)
date_final<-strptime(paste(epc_final$Date,epc_final$Time),format="%d/%m/%Y %H:%M:%S",tz="")
png("plot2.png",width=480,height=480,type="windows")
plot(date_final,gap,type="l",col="black",xlab="",ylab="Global Active Power (kilowatts)")
dev.off(dev.cur())


