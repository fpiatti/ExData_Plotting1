# Script for Plot 4

# Load libraries
library(lubridate)

# Load data
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

# Convert factor dates to date format
df$Date <- dmy(df$Date)

# Subset readings from Feb 1-2, 2007
n1 <- which(df$Date == "2007-02-01" & df$Time == "00:00:00")
n2 <- which(df$Date == "2007-02-03" & df$Time == "00:00:00")
sub_df <- df[n1:n2,]

# Convert format of readings to numeric
sub_df[,3] <- as.numeric(sub_df[,3])
sub_df[,4] <- as.numeric(sub_df[,4])
sub_df[,5] <- as.numeric(sub_df[,5])
sub_df[,7] <- as.numeric(sub_df[,7])
sub_df[,8] <- as.numeric(sub_df[,8])
sub_df[,9] <- as.numeric(sub_df[,9])

par(mfrow=c(2,2))

# Set plot margins
par(mar=c(3.0,4.1,4.1,2.1))

# First Plot
plot(sub_df$Global_active_power, xaxt = "n", ylab = "Global Active Power (kilowatts)", type = "l")
wd <- seq.Date(sub_df$Date[1], sub_df$Date[length(sub_df$Date)], by="day")
axis(1, at=c(1, 1440, 2881), labels=weekdays(wd, abbreviate = TRUE))

# Second Plot
plot(sub_df$Voltage, xaxt = "n", ylab = "Voltage", type = "l")
axis(1, at=c(1, 1440, 2881), labels=weekdays(wd, abbreviate = TRUE))

# Third Plot
plot(sub_df$Sub_metering_1, xaxt = "n", ylab = "Energy sub metering", type = "l", col = "black")
lines(sub_df$Sub_metering_2, type = "l", col = "red")
lines(sub_df$Sub_metering_3, type = "l", col = "blue")
axis(1, at=c(1, 1440, 2881), labels=weekdays(wd, abbreviate = TRUE))
legend(1000, 40, c("Sub Metering 3","Sub Metering 2", "Sub Metering 1"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("blue", "red", "black"), bty = "n")

# Fourth Plot
plot(sub_df$Global_reactive_power, xaxt = "n", ylab = "Energy sub metering", type = "l", col = "black")
axis(1, at=c(1, 1440, 2881), labels=weekdays(wd, abbreviate = TRUE))

# Generate PNG file
dev.print(png, file="plot4.png", width=480, height=480)
dev.off()