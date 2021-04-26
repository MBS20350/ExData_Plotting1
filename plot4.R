## EDA Week 1 project
## Plot 4
## Mark Sucato

library(dplyr)
library(lubridate)

## Load data
## Convert date/time variables to date/time classes
## Limit data to two-day period in Feb 2007

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- data %>%
  mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
  mutate(Time = hms::as_hms(strptime(Time, "%T"))) %>%
  filter((Date >= as.Date("2007-02-01")) & (Date <= as.Date("2007-02-02"))) %>%
  mutate(Time2 = ymd(Date) + hms(Time))

## Change dimensions to 480x480 px
## Create Plot 4 

dev.new(width=480, height=480, unit="px") 
par(mfrow = c(2, 2))

plot(data$Time2, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(data$Time2, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(data$Time2, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data$Time2, data$Sub_metering_2, type = "l", col = "red")
points(data$Time2, data$Sub_metering_3, type = "l", col = "blue")
series_names <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = series_names, text.width = strwidth(series_names)[1]*1.6)

plot(data$Time2, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

## Copy to PNG file

dev.copy(png, file = "plot4.png")
dev.off()