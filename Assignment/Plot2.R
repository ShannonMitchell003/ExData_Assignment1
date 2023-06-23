##Creating plot 2

#Reading in & renaming the dataset
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Subsetting the date for the first two days of February
Febpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# Transform the Date and Time variables
DT <- strptime(paste(Febpower$Date, Febpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global <- as.numeric(Febpower$Global_active_power)


#make the plot to png
png("plot2.png", width=480, height=480)
#creating the plot
plot(DT, Global, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#close off graphic device
dev.off()