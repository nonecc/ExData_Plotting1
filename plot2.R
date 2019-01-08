power_data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

#convert data to date type
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")

#select 2007-02-01 - 2007-02-02
power_data <- power_data[power_data$Date == '2007-02-01' | power_data$Date == '2007-02-02',]

#create date time from date and time columns
power_data$Date_Time <- as.POSIXct(paste(power_data$Date, power_data$Time), format="%Y-%m-%d %H:%M:%S")

#open png
png("plot2.png", height=480, width=480)

#create line plot
plot(x=power_data$Date_Time, y=power_data$Global_active_power, 
     type="l", 
     xlab="",
     ylab="Global Active Power (kilowatts)")

#close file
dev.off()