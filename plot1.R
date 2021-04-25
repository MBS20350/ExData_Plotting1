## EDA Week 1 project
## Plot 1
## Mark Sucato

library(dplyr)

## Load data
## Convert date/time variables to date/time classes
## Limit data to two-day period in Feb 2007

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- data %>%
  mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
  mutate(Time = hms::as_hms(strptime(Time, "%T"))) %>%
  filter((Date >= as.Date("2007-02-01")) & (Date <= as.Date("2007-02-02")))

## Change dimensions to 480x480 px
## Create Plot 1 

dev.new(width=480, height=480, unit="px")  
hist(data$Global_active_power, col = "red", xlab = NULL, main = NULL)
title(main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Copy to PNG file

dev.copy(png, file = "plot1.png")
dev.off()