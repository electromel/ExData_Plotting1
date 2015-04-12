# setwd("~/OneDrive/Formation/Coursera/Data Science/04 - Exploratory Data Analysis/ExData_Plotting1")

# load data
file <- "./household_power_consumption.txt"
data <- read.table(file, sep=";", header=TRUE, na.strings="?")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data <- subset(data, Date > as.Date("2007-01-31") & 
                     Date < as.Date("2007-02-03"))

# pring graph
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,file="./plot1.png")
dev.off()
