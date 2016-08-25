# Plot 4
# DSH 8/24/2016

#Read the data
df<-"household_power_consumption.txt"
data <- read.table(df,header=TRUE,sep=';',stringsAsFactors=FALSE)

data_subset<- data[data$Date %in% c("1/2/2007","2/2/2007"),]

globalActPower<-as.numeric(data_subset$Global_active_power)
subMet1<-as.numeric(data_subset$Sub_metering_1)
subMet2<-as.numeric(data_subset$Sub_metering_2)
subMet3<-as.numeric(data_subset$Sub_metering_3)
voltage<-as.numeric(data_subset$Voltage)
globalReactPower<-as.numeric(data_subset$Global_reactive_power)

#Get the dates and times in a readable format
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Make the Plot
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2)) #2x2 subplots

plot(datetime,globalActPower,type="l",xlab="",ylab="Global Active Power",cex=0.2)#UL

plot(datetime,voltage,type="l",xlab="datetime",ylab="Voltage")#UR

plot(datetime,subMet1,type="l",ylab="Energy Submetering",xlab="")#LL
lines(datetime,subMet2,type="l",col="red")
lines(datetime,subMet3,type="l",col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))

plot(datetime,globalReactPower,type="l",xlab="datetime",ylab="Global_reactive_power")#LR

dev.off()