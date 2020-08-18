#load the data 
library(data.table)
electric_power <- fread("household_power_consumption.txt", na.strings = "?")

# change from character to date class
electric_power$Date <- as.Date(electric_power$Date, "%d/%m/%Y")

electric_power <- electric_power %>% 
  mutate(date_time = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

# open the device
png("plot3.png", height = 480, width = 480)

plot(power_2007$date_time, power_2007$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(power_2007$date_time, power_2007$Sub_metering_2, col = "red")
lines(power_2007$date_time, power_2007$Sub_metering_3, col = "blue")
legend("topright",
       col = c("black", "red", "blue"),
       c("sub_metering_1 ", "sub_metering_2 ","sub_metering_3 "),
       lty = c(1,1), lwd = c(1,1))
dev.off()
