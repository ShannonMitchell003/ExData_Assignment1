##Creating plot 3

#Reading in & renaming the dataset
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Subsetting the date for the first two days of February
Febpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# Transform the Date and Time variables & seperating submetering variables
DT <- strptime(paste(Febpower$Date, Febpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Sub_metering_1 <- as.numeric(Febpower$Sub_metering_1)
Sub_metering_2 <- as.numeric(Febpower$Sub_metering_2)
Sub_metering_3 <- as.numeric(Febpower$Sub_metering_3)

#make the plot to png
png("plot3.png", width=480, height=480)
#creating the plot
plot(DT, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(DT, Sub_metering_2, type="l", col="red")
lines(DT, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#close off graphic device
dev.off()
