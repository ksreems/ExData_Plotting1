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

## Create plot4

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(power, {
  plot(DateTime, Global_Active_Power, type="l",xlab="",ylab="Global Active Power")
  plot(DateTime, Voltage, type="l", xlab="datetime",ylab="Voltage")
  plot(power$DateTime, power$Sub_metering_1,type="l",col="black", xlab = "",
       ylab = "Energy sub metering")
  lines(power$DateTime, power$Sub_metering_2,col="red")
  lines(power$DateTime, power$Sub_metering_3,col="blue")
  legend("topright", lty = c(1,1), col = c("black", "red", "blue"), bty="n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_Reactive_Power, type="l", xlab="datetime",
       ylab="Global_reactive_power")})
dev.off()
