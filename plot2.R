#load the data 
library(data.table)
electric_power <- fread("household_power_consumption.txt", na.strings = "?")

electric_power <- electric_power %>% 
  mutate(date_time = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

#subsett your data
power_2007 <- electric_power %>% filter((Date >= "2007-02-01") & (Date <= "2007-02-02"))

# create the png device
png("plot2.png", height = 480, width = 480)

plot(power_2007$date_time, power_2007$Global_active_power, type = "l", 
     xlab = "",
     ylab = " Global Active Power (kilowatts)")
dev.off()
