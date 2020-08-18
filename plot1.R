#load the data 
library(data.table)
electric_power <- fread("household_power_consumption.txt", na.strings = "?")

library(tidyverse)

# subsetting the data
power_2007 <- electric_power %>% filter((Date >= "2007-02-01") & (Date <= "2007-02-02"))

png("plot1.png", height = 480, width = 480)

power_2007 %>% ggplot(aes(Global_active_power))+
  geom_histogram(fill = "red", color = "black")+
  labs(title = "Global Active Power",
       x = "Global Active Power (kilowatts)",
       y = "Frequency")+
  ylim(c(0,1200))

dev.off()
