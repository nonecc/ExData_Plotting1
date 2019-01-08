power_data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

#convert data to date type
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")

#select 2007-02-01 - 2007-02-02
power_data <- power_data[power_data$Date == '2007-02-01' | power_data$Date == '2007-02-02',]

#open png
png("plot1.png", height=480, width=480)

#generate plot
hist(power_data$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", 
     col="red")

#close file
dev.off()
