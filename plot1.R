## Read in data for 1st-2nd Feb 2007

power <- read.table("household_power_consumption.txt",skip= 66637,nrows= 2880, 
                   header=FALSE, sep=";", stringsAsFactors = FALSE, dec = ".")
colnames(power) <- c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power",
                     "Voltage", "Global_Intensity", "Sub_metering_1", 
                     "Sub_metering_2", "Sub_metering_3")

## Create plot 1

png("plot1.png", width=480, height=480)
hist(power$Global_Active_Power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
