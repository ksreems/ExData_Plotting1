## Read in data for 1st-2nd Feb 2007

power <- read.table("household_power_consumption.txt",skip= 66637,nrows= 2880, 
                    header=FALSE, sep=";", stringsAsFactors = FALSE, dec = ".")
colnames(power) <- c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power",
                     "Voltage", "Global_Intensity", "Sub_metering_1", 
                     "Sub_metering_2", "Sub_metering_3")

## Convert date and time

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power <- transform(power, DateTime=as.POSIXct(paste(Date, Time)), 
                   "%d/%m/%Y %H:%M:%S")

## Create plot2

png("plot2.png", width=480, height=480)
plot(power$DateTime, power$Global_Active_Power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()
