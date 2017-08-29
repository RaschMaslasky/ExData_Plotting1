# ===================================================
# Exploratory Data Analysis, week 1, plot1.R
# Mirzarashid Abbasov
# ---------------------------------------------------
# Download and unzip the dataset which obtained from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#
# --------------------------------------------------

# Calculate arough estimate of how much memeory the dataset will require 
# 2075259 x 9 x 8 / 1024 / 1024 ~ 142 MB

# set working directory
setwd("/Users/mirzarashid.abbasov/repos/Exploratory_Data_Analysis/week1/project")

# clean up workspance
rm(list = ls())

# check the loaded record amount
dim(myData)

# read data from files
tempData <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?")

# check data set columns class
sapply(tempData, class)

# select data between "2007-02-01" and "2007-02-02",
myData <- subset(tempData, Date %in% c("1/2/2007","2/2/2007"))

# clear a temp data
rm(tempData)

# change the values from character to numeric
myData <- mutate(myData, Global_active_power   = as.numeric(Global_active_power), 
                         Global_reactive_power = as.numeric(Global_reactive_power),
                         Voltage = as.numeric(Voltage),
                         Sub_metering_1 = as.numeric(Sub_metering_1),
                         Sub_metering_2 = as.numeric(Sub_metering_2))

# choose device
png("plot1.png", width=480, height=480)

## Plot 1
with(myData, hist(Global_active_power, col = "red", 
                                        main="Global Active Power",
                                        xlab="Global Active Power (kilowatts)"))
# close current device
dev.off()