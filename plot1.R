## EDA Week 1 project
## Plot 1
## Mark Sucato

library(dplyr)
library(lubridate)

## Load data and convert date/time variables to date/time classes via lubridate

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- data %>%
	mutate(Date = dmy(Date)) %>%
	mutate(Time = hms(Time))

## Need to select just data for 2007-02-01 and 2007-02-02





hist(data$Global_active_power, col = "red", xlab = NULL, main = NULL)
title(main = "Global Active Power", xlab = "Global Active Power (kilowatts)")