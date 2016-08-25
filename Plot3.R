# Plot 3 
# DSH 8/24/2016

#Read the data
df<-"household_power_consumption.txt"
data <- read.table(df,header=TRUE,sep=';',stringsAsFactors=FALSE)

data_subset<- data[data$Date %in% c("1/2/2007","2/2/2007"),]

globalActPower<-as.numeric(data_subset$Global_active_power)
subMet1<-as.numeric(data_subset$Sub_metering_1)
subMet2<-as.numeric(data_subset$Sub_metering_2)
subMet3<-as.numeric(data_subset$Sub_metering_3)

#Get the dates and times in a readable format
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Make the Plot
png("plot3.png",width=480,height=480)
plot(datetime,subMet1,type="l",ylab="Energy Submetering",xlab="")
lines(datetime,subMet2,type="l",col="red")
lines(datetime,subMet3,type="l",col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))
dev.off()