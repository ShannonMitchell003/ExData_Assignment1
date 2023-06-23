##Creating plot 1

#Reading in & renaming the dataset
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Subsetting the daat for the first two days of February
Febpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#make the plot to png
png("plot1.png", width=480, height=480)
#creating the plot
hist((as.numeric(as.character(Febpower$Global_active_power))), col="red", xlab="Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
#close off graphic device
dev.off()