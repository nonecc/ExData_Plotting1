power_data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

#convert data to date type
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")

#select 2007-02-01 - 2007-02-02
power_data <- power_data[power_data$Date == '2007-02-01' | power_data$Date == '2007-02-02',]

#create date time from date and time columns
power_data$Date_Time <- as.POSIXct(paste(power_data$Date, power_data$Time), format="%Y-%m-%d %H:%M:%S")

#open png
png("plot4.png", height=480, width=480)

#set device to be 2x2 grid
par(mfrow=c(2, 2))

#create 4 plots
plot(x=power_data$Date_Time, y=power_data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")
plot(x=power_data$Date_Time, y=power_data$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")
plot(x=power_data$Date_Time, y=power_data$Sub_metering_1, type="n",
     xlab="",
     ylab="Global Active Power (kilowatts)")
lines(x=power_data$Date_Time, 
      y=power_data$Sub_metering_1, 
      col="black") 
lines(x=power_data$Date_Time, 
      y=power_data$Sub_metering_2, 
      col="red")
lines(x=power_data$Date_Time, 
      y=power_data$Sub_metering_3, 
      col="blue")
legend("topright", 
       legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"),
       col=c("black", "red", "blue"), lty=1, box.lty=0)
plot(x=power_data$Date_Time, y=power_data$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

#close file
dev.off()