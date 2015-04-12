# setwd("~/OneDrive/Formation/Coursera/Data Science/04 - Exploratory Data Analysis/ExData_Plotting1")

# load data
file <- "./household_power_consumption.txt"
data <- read.table(file, sep=";", header=TRUE, na.strings="?")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data <- subset(data, Date > as.Date("2007-01-31") & 
                   Date < as.Date("2007-02-03"))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# pring graph
plot(data$DateTime,data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file="./plot2.png")
dev.off()
