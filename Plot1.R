# Plot 1 
# DSH 8/24/2016

#Read the data
df<-"household_power_consumption.txt"
data <- read.table(df,header=TRUE,sep=';',stringsAsFactors=FALSE)

data_subset<- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Make the plot
globalActPower<-as.numeric(data_subset$Global_active_power)
png("plot1.png",width=480,height = 480)
hist(globalActPower,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()