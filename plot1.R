###Exploratory Analysis Week 1 Assignment

##Cleaninig the Data, filtering by the required interval and eliminating rows with "?" first creating these as "NA"
epc<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors = FALSE,na.strings = "?")
epc_no_na<-epc[!is.na(epc),]
epc1<-subset(epc_no_na,epc_no_na$Date=="1/2/2007")
epc2<-subset(epc_no_na,epc_no_na$Date=="2/2/2007")
epc_final<-rbind(epc1,epc2)

##Plot 1
gap<-as.numeric(epc_final$Global_active_power)
png("plot1.png",width=480,height=480,type="windows")
hist(gap,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off(dev.cur())


