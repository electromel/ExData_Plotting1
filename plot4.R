# setwd("~/OneDrive/Formation/Coursera/Data Science/04 - Exploratory Data Analysis/ExData_Plotting1")

# load data
file <- "./household_power_consumption.txt"
data <- read.table(file, sep=";", header=TRUE, na.strings="?")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data <- subset(data, Date > as.Date("2007-01-31") & 
                   Date < as.Date("2007-02-03"))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# pring graph
par(mfcol=c(2,2))
plot(data$DateTime,data$Global_active_power, type="l",ylab="Global Active Power",xlab="")
plot(data$DateTime,data$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(data$DateTime,data$Sub_metering_2, type="l", col="red")
lines(data$DateTime,data$Sub_metering_3, type="l", col="blue")
legend("topright", box.lwd=0, legend=names(data[7:9]), lty=1, col=c("black","red","blue"), cex=0.7)
plot(data$DateTime,data$Voltage, type="l",ylab="Voltage",xlab="datetime")
plot(data$DateTime,data$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")
dev.copy(png,file="plot4.png")
dev.off()