# Plot 2 
# DSH 8/24/2016

#Read the data
df<-"household_power_consumption.txt"
data <- read.table(df,header=TRUE,sep=';',stringsAsFactors=FALSE)

data_subset<- data[data$Date %in% c("1/2/2007","2/2/2007"),]

globalActPower<-as.numeric(data_subset$Global_active_power)

#Get the dates and times in a readable format
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Make the Plot
png("plot2.png",width=480,height=480)
plot(datetime,globalActPower,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()